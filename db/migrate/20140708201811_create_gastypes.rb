class CreateGastypes < ActiveRecord::Migration
  def change
    create_table :gastypes do |t|
      t.string :gas_type, limit: 25

      t.timestamps
    end
  end
end
