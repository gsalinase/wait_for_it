class CreateCompanyConfigurations < ActiveRecord::Migration[5.2]
  def change
    create_table :company_configurations do |t|
      t.time :work_start
      t.time :work_end
      t.jsonb :working_day
      t.jsonb :service_type
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
