class Review < ApplicationRecord
    belongs_to :user
    belongs_to :movie 

    validates :rating, presence: true
    validates :comment, presence: true, length: { in: 6..120 }
    default_scope { order(created_at: :desc)}
   
end 
