class AddStreetballCatalogFieldsToItems < ActiveRecord::Migration[7.2]
  def change
    add_column :items, :item_type, :string
    add_column :items, :rarity, :string
    add_column :items, :price, :integer
    add_column :items, :stats, :json
    add_column :items, :modifiers, :json
    add_column :items, :description, :text
  end
end