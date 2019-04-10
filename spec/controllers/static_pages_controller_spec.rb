require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about_me" do
    it "returns http success" do
      get :about_me
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #yoyo_maintenance" do
    it "returns http success" do
      get :yoyo_maintenance
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #tricks" do
    it "returns http success" do
      get :tricks
      expect(response).to have_http_status(:success)
    end
  end

end
