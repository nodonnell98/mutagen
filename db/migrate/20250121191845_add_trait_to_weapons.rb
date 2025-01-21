class AddTraitToWeapons < ActiveRecord::Migration[8.0]
  def change
    add_reference :weapons, :trait, foreign_key: true
  end
end
