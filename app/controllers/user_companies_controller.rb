class UserCompaniesController < ApplicationController
  before_action :authenticate_user!

  def total_company
    if current_user
      @user_companies = UserCompany.by_user(current_user.id).group_by_day_of_week(:created_at, format: "%a").count
      render json: @user_companies
    end
  end
end
