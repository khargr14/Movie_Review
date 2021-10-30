class CreateSuggestions < ActiveRecord::Migration[6.0]
  def change
    create_table :suggestions do |t|
      t.string :title
      t.text :description
      t.text :comment
      t.attachment :movie_img
      t.timestamps
    end
  end
end
