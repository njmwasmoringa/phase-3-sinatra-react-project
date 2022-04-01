class AddOrderIdProductIdToOrderProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :order_products, :order_id, :integer
    add_column :order_products, :product_id, :integer
  end
end
