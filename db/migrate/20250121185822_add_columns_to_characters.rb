class AddColumnsToCharacters < ActiveRecord::Migration[8.0]
  def change
    add_column :characters, :current_health, :integer
  end
end
