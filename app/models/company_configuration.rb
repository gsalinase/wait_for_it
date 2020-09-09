class CompanyConfiguration < ApplicationRecord
  belongs_to :company

  scope :by_company, -> (company_id) { where(company_id: company_id) }
end
