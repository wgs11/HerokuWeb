class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :game_id
      t.string :cat_name
      t.integer :time
      t.string :video_url

      t.timestamps
    end
  end
end
