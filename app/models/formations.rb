class Formations < ActiveRecord::Base
  has_and_belongs_to_many :fields, join_table: :fields_formations
end
