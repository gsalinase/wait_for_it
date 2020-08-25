class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  has_many :tickets
  has_many :user_companies
  has_many :companies, through: :user_companies
  accepts_nested_attributes_for :companies

  def self.create_company(params)
    ActiveRecord::Base.transaction do
      company = Company.new(params)
      company.save
      raise.ActiveRecord::Rollback
    end
  end

  # Como asignar usuario company al crear usuario
  def self.create_user_company
    ActiveRecord::Base.transaction do
      UserCompany.create(user_id: user.last, company_id: Company.last)
      raise.ActiveRecord::Rollback
    end
  end
end
