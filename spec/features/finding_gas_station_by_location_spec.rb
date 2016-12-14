require 'rails_helper'

describe "as s user" do
  context "when i visit root" do
    scenario "a fill in a form by address" do

      visit "/"

      fill_in :q, with: '07871'
      click_button "Locate"
      expect(current_path).to eq(search_path)
    end
  end
end
