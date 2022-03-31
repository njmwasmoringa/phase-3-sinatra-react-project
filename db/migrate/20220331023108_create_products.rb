class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.string :code
      t.float :ratail_price
      t.float :wholesale_price
      t.float :purchase_price
      t.integer :stock
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
