class Companies < ActiveRecord::Base
  has_many :facilities, dependent: :destroy
  #attr_accessor :company_name, :operator_num
  
end
