class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.references :company, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :ticket_number
      t.boolean :priority
      t.integer :state

      t.timestamps
    end
  end
end
