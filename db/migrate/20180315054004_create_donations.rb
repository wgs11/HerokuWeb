class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.decimal :progress
      t.decimal :total
      t.string :incentive
      t.string :image_url

      t.timestamps
    end
  end
end
