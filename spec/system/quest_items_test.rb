require "application_system_test_case"

describe "QuestItems" do
  context "when visiting the Academy Quest Items page" do
    it "displays the quest items" do
      visit_quest_items_page
      should_see_the_content
    end
  end
end

def visit_quest_items_page
  visit quest_items_path
end

def should_see_the_content
  expect(page).to have_content("My Quest Items")
  expect(page).to have_content("My Academy Quest")
end

