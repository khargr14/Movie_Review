class Suggestion < ApplicationRecord
  has_one_attached :movie_img
  belongs_to :user
  belongs_to :movie 

end
