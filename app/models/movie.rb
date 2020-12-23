class Movie < ApplicationRecord
    belongs_to :user
  
    has_many :reviews
    has_many :users, through: :reviews

   
    has_attached_file :movie_img, styles: { movie_index: "250x350>", movie_show: "325x475>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :movie_img, content_type: /\Aimage\/.*\z/

   
    validates :title, :description, presence: true


    def ratings
        self.reviews.collect(&:rating)
    end
end
