class CreateEntityTraits < ActiveRecord::Migration[8.0]
  def change
    create_table :entity_traits do |t|
      t.references :entity, polymorphic: true, null: false
      t.references :trait, null: false, foreign_key: true
      t.boolean :core_trait, default: false
      t.integer :base_value
      t.integer :cached_value

      t.timestamps
      # add_index :entity_traits, [:entity_id, :entity_type, :trait_id], unique: true, name: 'index_entity_traits_unique'
    end
  end
end
