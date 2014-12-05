class Fields < ActiveRecord::Base
  has_many :fields_formations
  has_many :facilities, through: :fields_formations
end
