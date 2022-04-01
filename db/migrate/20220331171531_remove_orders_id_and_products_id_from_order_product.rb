class RemoveOrdersIdAndProductsIdFromOrderProduct < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_products, :products_id
    remove_column :order_products, :orders_id
  end
end
