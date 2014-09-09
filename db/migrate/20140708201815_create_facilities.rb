class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.string :facility_name, limit: 50
      t.integer :facility_num
      t.integer :ground_elevation
      t.decimal :latitude, :precision => 10, :scale => 5, :default => 0
      t.decimal :longitude, :precision => 10, :scale => 5, :default => 0
      t.string :meridian, limit: 5
      t.integer :utm_x
      t.integer :utm_y

      t.timestamps
    end
  end
end
