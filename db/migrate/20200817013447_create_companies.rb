class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :industry
      t.text :address
      t.text :phone
      t.string :email

      t.timestamps
    end
  end
end
