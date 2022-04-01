class RemoveCustomersIdFromOrder < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :customers_id
  end
end
