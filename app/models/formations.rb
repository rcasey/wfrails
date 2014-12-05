class Formations < ActiveRecord::Base
  has_many :field_formations
  has_many :fields, through: :fields_formations
end
