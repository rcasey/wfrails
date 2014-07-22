class Companies < ActiveRecord::Base
  has_many :facilities, dependent: :destroy
end
