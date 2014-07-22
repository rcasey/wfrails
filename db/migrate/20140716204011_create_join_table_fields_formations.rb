class CreateJoinTableFieldsFormations < ActiveRecord::Migration
  def change
    create_join_table :fields, :formations 
  end
end
