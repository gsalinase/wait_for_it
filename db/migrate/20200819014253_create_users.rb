class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.text :phone
      t.string :email
      t.integer :role
      t.date :birthday
      t.boolean :critical_role

      t.timestamps
    end
  end
end
