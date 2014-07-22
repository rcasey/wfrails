class Wells < ActiveRecord::Base
  belongs_to :facilities
  has_one :gas_types
end
