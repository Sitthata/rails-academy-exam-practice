require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get brags_documents_path
      expect(response).to have_http_status(:success)
    end
  end
end
