class Company < ApplicationRecord
  has_many :ticket, dependent: :destroy
  has_many :user_companies, dependent: :destroy
  has_one :company_configuration, dependent: :destroy

  scope :by_user, -> (user_id) { where(user_id: user_id) }

  def create_user_company(user_id)
    # TODO: agregar validación (buscar transaction)
    UserCompany.create(
      company_id: id,
      user_id: user_id
    )
  end

  def create_user_configuration()
    CompanyConfiguration.create(
      work_start: '09:00',
      work_end: '18:00',
      working_day: {
        days: ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes']
      },
      service_type: {
        service: []
      },
      company_id: id,
    )
  end
end
