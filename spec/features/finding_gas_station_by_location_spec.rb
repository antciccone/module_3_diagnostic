require 'rails_helper'

describe "as s user" do
  context "when i visit root" do
    scenario "a fill in a form by address" do
      VCR.use_cassette("#user_store") do

      visit "/"

      fill_in :q, with: '80203'
      click_button "Locate"

      expect(current_path).to eq(search_path)
      expect(page).to have_content("Name")
      expect(page).to have_content("Address")
      expect(page).to have_content("Fuel Type")
      expect(page).to have_content("Distance")
      expect(page).to have_content("Hours")
      end
    end
  end
end
