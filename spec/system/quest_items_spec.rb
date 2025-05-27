require "rails_helper"

describe "QuestItems", type: :system do
  context "when visiting the Academy Quest Items page" do
    before do
      visit_quest_items_page
    end
    it "displays the title content of the page" do
      should_see_the_title_content
    end

    it "should have a link to go to brag documents" do
      should_see_a_link_to_brag_documents
      click_on_the_brag_documents_link_should_redirect_to_brag_documents
    end
  end

  context "when user wants to create a new quest item" do
    let!(:quest_item) { create(:quest_item, name: "Existing Quest Item") }
    let!(:not_completed_quest) { create(:quest_item, name: "My Academy Quest", completed: false) }

    before do
      visit_quest_items_page
    end

    it "allow user to create a quest" do
      click_link id: "new-quest-button"
      fill_in id: "quest-item-name", with: "New Quest Item"
      click_button id: "create-quest-button"
      expect(page).to have_content("New Quest Item")
    end

    it "allows user to delete a quest item" do
      expect(find_by_id("quest_item_#{quest_item.id}")).to be_present
      delete_button = find_by_id("delete-quest-button-#{quest_item.id}")
      delete_button.click

      expect(page).not_to have_content(quest_item.name)
    end

    it "allows user to edit the status of a quest item" do
      expect(find_by_id("quest_item_#{not_completed_quest.id}")).to be_present
      checkbox = find_by_id("checkbox-#{not_completed_quest.id}")
      checkbox.click
      sleep 1
      not_completed_quest.reload
      expect(not_completed_quest.completed).to be true
    end
  end
end

def visit_quest_items_page
  visit root_path
end

def should_see_the_title_content
  expect(page).to have_content("My Quest Items")
  expect(page).to have_content("My Academy Quest")
end

def should_see_a_link_to_brag_documents
  expect(find_by_id('brag-link')).to be_present
end

def click_on_the_brag_documents_link_should_redirect_to_brag_documents
  click_link(id: "brag-link")
  expect(page).to have_current_path(brags_documents_path)
end
