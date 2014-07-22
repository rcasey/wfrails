class CreateFormations < ActiveRecord::Migration
  def change
    create_table :formations do |t|
      t.string :formation, limit: 100
      t.string :formation_code, limit: 10

      t.timestamps
    end
  end
end
