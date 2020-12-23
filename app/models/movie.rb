class Movie < ApplicationRecord
    belongs_to :user
  
    has_many :reviews
    has_many :users, through: :reviews

    #you need to raise the point with them. using deprecated software is a security hazard
    #### why are they still using paperclip? this was deprecated in favour of activestorage.
    has_attached_file :movie_img, styles: { movie_index: "250x350>", movie_show: "325x475>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :movie_img, content_type: /\Aimage\/.*\z/

    ## This can be combined
    validates :title, :description, presence: true


    def ratings
        self.reviews.collect(&:rating)
    end
end
