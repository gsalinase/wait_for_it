class Company < ApplicationRecord
  has_many :tickets
  has_many :user_companies
  has_one :company_configuration
end
