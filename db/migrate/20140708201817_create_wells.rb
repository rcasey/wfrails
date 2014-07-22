class CreateWells < ActiveRecord::Migration
  def change
    create_table :wells do |t|
      t.string :well_name
      t.integer :api_county_code
      t.integer :api_seq_num
      t.integer :sidetrack_num
      t.string :api_num, limit: 50
      t.string :formation_code, limit: 10
      t.date :spuddate
      t.date :td_date
      t.integer :wb_meas_depth
      t.integer :wb_tvd
      t.date :test_date
      t.string :well_bore_status, limit: 5
      t.date :status_date
      t.date :first_prod_date

      t.timestamps
    end
  end
end
