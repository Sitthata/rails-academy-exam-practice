require 'rails_helper'

RSpec.describe "QuestItems", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/quest_items"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/quest_items/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    let(:valid_attributes) { { name: "Added New Quest Item", completed: false } }

    it "creates a new quest item" do
      expect {
        post quest_items_path, params: { quest_item: valid_attributes }
      }.to change(QuestItem, :count).by(1)
      expect(response).to redirect_to(quest_items_path)
    end
  end

  describe "PATCH /update" do
    let(:quest_item) { create(:quest_item) }

    it "changes the completed status" do
      patch quest_item_path(quest_item), params: { quest_item: { completed: true } }
      quest_item.reload
      expect(quest_item.completed).to be true
    end
  end

  describe "DELETE /destroy" do
    let!(:quest_item) { create(:quest_item, name: "To be Deleted") }

    it "deleted the existed quest item" do
      expect {
        delete quest_item_path(quest_item)
      }.to change(QuestItem, :count).by(-1)
      expect(response).to redirect_to(quest_items_path)
    end
  end
end
