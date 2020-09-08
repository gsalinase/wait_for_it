class Company < ApplicationRecord
  has_many :tickets
  has_many :user_companies
  has_one :company_configuration

  scope :by_user, -> (user_id) { where(user_id: user_id) }

  def create_user_company(user_id)
    # TODO: agregar validación (buscar transaction)
    UserCompany.create(
      company_id: id,
      user_id: user_id
    )
  end
end
