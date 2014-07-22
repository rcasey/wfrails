class AddForeignKeysToFacilities < ActiveRecord::Migration
  def change
    add_column :facilities, :company_id, :integer
    add_column :facilities, :county_id, :integer
    add_column :facilities, :field_id, :integer
  end
end
