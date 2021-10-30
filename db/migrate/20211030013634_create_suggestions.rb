class CreateSuggestions < ActiveRecord::Migration[6.0]
  def change
    create_table :suggestions do |t|
      t.string :title
      t.text :description
      t.text :comment

      t.timestamps
    end
  end
end
