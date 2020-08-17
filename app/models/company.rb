class Company < ApplicationRecord
  has_many :tickets
  has_one :company_configuration
end
