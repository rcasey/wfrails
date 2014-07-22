class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :field_name, limit: 100
      t.string :field_code, limit: 20

      t.timestamps
    end
  end
end
