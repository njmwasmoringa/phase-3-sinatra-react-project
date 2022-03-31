class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
