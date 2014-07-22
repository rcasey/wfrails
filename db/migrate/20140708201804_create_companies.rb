class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_name, limit: 100
      t.integer :operator_num

      t.timestamps
    end
  end
end
