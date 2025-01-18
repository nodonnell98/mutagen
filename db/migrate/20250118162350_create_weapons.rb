class CreateWeapons < ActiveRecord::Migration[8.0]
  def change
    create_table :weapons do |t|
      t.string :name, null: false
      t.string :description
      t.integer :damage_dice
      t.integer :damage_dice_qty
      t.integer :ammo
      t.integer :range
      t.integer :quality

      t.timestamps
    end
  end
end
