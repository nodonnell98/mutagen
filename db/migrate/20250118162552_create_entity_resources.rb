class CreateEntityResources < ActiveRecord::Migration[8.0]
  def change
    create_table :entity_resources do |t|
      t.references :entity, polymorphic: true, null: false
      t.references :resource, polymorphic: true, null: false

      t.timestamps
    end
    add_index :entity_resources, [:entity_id, :entity_type, :resource_id, :resource_type], unique: true, name: 'index_entity_resources_unique'
  end
end
