class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, only: [:show, :update, :destroy]

  def index
    if params[:user_id]
      @companies = UserCompany.by_user(params[:user_id])
      @companies = @companies.map{ |company| company.company }
    else
      @companies = Company.all
    end

    render json: @companies
  end

  # GET /companies/1
  def show
    render json: @company
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      if current_user.present?
        @company.create_user_company(current_user.id)
        @company.create_user_configuration()
      end
      render json: @company, status: :created, location: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
  end

  def total_companies
    if current_user
      @companies = Company.by_user(current_user.id)
      #@ticket = @companies.company
      render json: @companies
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def company_params
      params.require(:company).permit(:name, :industry, :address, :phone, :email, :user_id)
    end
end
