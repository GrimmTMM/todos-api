require 'rails_helper'

RSpec.describe "Notifications", type: :request do
  describe "GET /notify" do
    it "returns http success" do
      get "/notifications/notify"
      expect(response).to have_http_status(:success)
    end
  end

end
