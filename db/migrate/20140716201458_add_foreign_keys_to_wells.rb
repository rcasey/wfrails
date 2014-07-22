class AddForeignKeysToWells < ActiveRecord::Migration
  def change
    add_column :wells, :facility_id, :integer
    add_column :wells, :gastype_id, :integer
  end
end
