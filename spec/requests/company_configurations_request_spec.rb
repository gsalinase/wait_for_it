require 'rails_helper'

RSpec.describe "CompanyConfigurations", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/company_configurations/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/company_configurations/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/company_configurations/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/company_configurations/create"
      expect(response).to have_http_status(:success)
    end
  end

end
