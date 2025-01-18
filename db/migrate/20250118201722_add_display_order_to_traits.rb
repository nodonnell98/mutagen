class AddDisplayOrderToTraits < ActiveRecord::Migration[8.0]
  def change
    add_column :traits, :display_order, :integer
  end
end
