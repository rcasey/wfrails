class Facilities < ActiveRecord::Base
  belongs_to :companies, :foreign_key => "company_id"
  has_one :counties
  has_many :wells
end
