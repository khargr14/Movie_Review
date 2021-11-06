class Suggestion < ApplicationRecord
   has_one_attached :movie_img
  belongs_to :user
  belongs_to :movie 
   has_attached_file :movie_img, styles: { movie_index: "250x350>", movie_show: "325x475>" }, default_url: "/images/:style/missing.png"
   validates_attachment_content_type :movie_img, content_type: /\Aimage\/.*\z/

 
  validates :title, :description, presence: true

   has_one_attached :cover_picture
end
