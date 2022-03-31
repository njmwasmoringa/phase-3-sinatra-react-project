class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customers, index: true
      t.integer :order_number
      t.float :total_cost
      # the status of the order could be:
      # placed, pending_payment, checked_out, in_packaging, dispatched, delivered
      t.string :status, :default => "placed"
      t.text :delivery_details, :default => ""
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
