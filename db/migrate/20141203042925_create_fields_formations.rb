class CreateFieldsFormations < ActiveRecord::Migration
  def change
    create_table :fields_formations do |t|
      t.integer :fields_id
      t.integer :formations_id
      t.timestamps
    end
  end
end
