class CreateModifiers < ActiveRecord::Migration[8.0]
  def change
    create_table :modifiers do |t|
      t.references :target, polymorphic: true, null: false
      t.references :source, polymorphic: true, null: false
      t.integer :modifier

      t.timestamps
    end
  end
end
