# spec/features/create_new_tool_spec.rb
require "rails_helper"

describe "Create new tool", :type => :feature do
  scenario "User creates a new tool" do
    visit new_tool_path
    # same as: visit "/tools/new"

    fill_in "Name", :with => "Screwdriver"
    fill_in "Quantity", :with => "11"
    fill_in "Price", :with => "5"
    click_button "Create Tool"

    within(".tool_info") do
      expect(page).to have_content("driver")
      expect(page).to have_content(11)
      expect(page).to have_content(5)
    end
  end
end

describe "Delete a tool" do
  scenario "user can delete a tool and sees that it in no longer listed" do
    Tool.create(name: "Axe", price: 1224, quantity: 23)

    visit tool_path(Tool.last)

    click_on "Delete"

    expect(page).to have_content("Tool Index")
    within(".tool_info") do
      expect(page).not_to have_content("Axe")
    end
  end
end
