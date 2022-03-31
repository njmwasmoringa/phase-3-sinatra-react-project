class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
      t.references :products, :orders, index: true
      t.integer :quantity
      t.integer :discounted_price
    end
  end
end
