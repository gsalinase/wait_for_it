class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  has_many :tickets, dependent: :destroy
  has_many :user_companies, dependent: :destroy
  has_many :companies, through: :user_companies
  has_many :jwt_denylists
  accepts_nested_attributes_for :companies

  # def self.create_company(params)
  #   ActiveRecord::Base.transaction do
  #     company = Company.new(params)
  #     company.save
  #   end
  # rescue ActiveRecord::RecordInvalid => e
  #   e.message
  # end

  # Como crear transaccion para que se cree la relacion entre usuario y compania
  #def self.create_user_company
    #ActiveRecord::Base.transaction do
      #UserCompany.create(user_id: user.last, company_id: Company.last)
      #raise.ActiveRecord::Rollback
    #end
  #end
end