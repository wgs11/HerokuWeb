class AddNameToP5 < ActiveRecord::Migration[5.1]
  def change
    add_column :p5s, :name, :string
  end
end
