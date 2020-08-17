class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.text :phone
      t.string :email
      t.integer :customer_type
      t.date :birthday
      t.boolean :critical_role

      t.timestamps
    end
  end
end
