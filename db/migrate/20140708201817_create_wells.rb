class CreateWells < ActiveRecord::Migration
  def change
    create_table :wells do |t|
      t.integer :api_county_code
      t.string :api_num, limit: 50
      t.integer :api_seq_num
      t.string :dir_e_w, limit: 10
      t.string :dir_n_s, limit: 10
      t.string :dist_e_w, limit: 10
      t.string :dist_n_s, limit: 10
      t.date :first_prod_date
      t.date :form_status_date
      t.string :formation_status, limit: 10
      t.string :qtrqtr, limit: 6
      t.string :range, limit: 5      
      t.integer :sec      
      t.integer :sidetrack_num
      t.date :spud_date
      t.date :status_date
      t.date :td_date
      t.date :test_date
      t.string :township, limit: 10
      t.integer :wb_meas_depth
      t.integer :wb_tvd
      t.string :well_bore_status, limit: 5
      t.string :well_name

      t.timestamps
    end
  end
end
