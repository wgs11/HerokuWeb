class CreateP5s < ActiveRecord::Migration[5.1]
  def change
    create_table :p5s do |t|

      t.timestamps
    end
  end
end
