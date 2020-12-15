class AddRatingToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :rating, :string
  end
end
