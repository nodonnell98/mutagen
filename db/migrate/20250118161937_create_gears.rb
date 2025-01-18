class CreateGears < ActiveRecord::Migration[8.0]
  def change
    create_table :gears do |t|
      t.string :name, null: false
      t.text :description
      t.integer :weight
      t.integer :value

      t.timestamps
    end
  end
end
