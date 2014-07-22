class CreateCounties < ActiveRecord::Migration
  def change
    create_table :counties do |t|
      t.string :county_name, limit: 30

      t.timestamps
    end
  end
end
