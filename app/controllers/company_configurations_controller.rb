class CompanyConfigurationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company_configuration, only: [:show, :update, :destroy]

  def index
    if params[:company_id]
      @company_configurations = CompanyConfiguration.by_company(params[:company_id])
    else
      @company_configurations = CompanyConfiguration.all
    end

    render json: @company_configurations
  end

  # GET /company_configuration/1
  def show
    render json: @company_configuration
  end

  # POST /company_configurations
  def create
    @company_configuration = CompanyConfiguration.new(company_configuration_params)

    if @company_configuration.save
      render json: @company_configuration, status: :created, location: @company_configuration
    else
      render json: @company_configuration.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /company_configurations/1
  def update
    if @company_configuration.update(company_configuration_params)
      render json: @company_configuration
    else
      render json: @company_configuration.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company_configuration.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_configuration
      @company_configuration = CompanyConfiguration.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def company_configuration_params
      params.require(:company_configuration).permit(
        :work_start,
        :work_end,
        :company_id,
        working_day:[
          days:[]
        ],
        service_type:[
          service: []
        ],
      )
    end
end
