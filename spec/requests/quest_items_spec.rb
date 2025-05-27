require 'rails_helper'

RSpec.describe "QuestItems", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/quest_items/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/quest_items/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/quest_items/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/quest_items/delete"
      expect(response).to have_http_status(:success)
    end
  end

end
