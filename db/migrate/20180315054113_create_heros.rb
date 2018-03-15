class CreateHeros < ActiveRecord::Migration[5.1]
  def change
    create_table :heros do |t|
      t.string :name
      t.integer :total
      t.integer :unlocks
      t.string :image_url

      t.timestamps
    end
  end
end
