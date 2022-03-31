class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :password_hash
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
