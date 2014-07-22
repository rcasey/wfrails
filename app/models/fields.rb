class Fields < ActiveRecord::Base
  has_many :facilities
  has_and_belongs_to_many :formations, join_table: :fields_formations
end
