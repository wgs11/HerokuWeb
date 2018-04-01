class AddScriptToP5 < ActiveRecord::Migration[5.1]
  def change
    add_column :p5s, :script_body, :string
  end
end
