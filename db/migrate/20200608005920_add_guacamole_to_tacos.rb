class AddGuacamoleToTacos < ActiveRecord::Migration[6.0]
  def change
    add_column :tacos, :guacamole, :boolean
  end
end
