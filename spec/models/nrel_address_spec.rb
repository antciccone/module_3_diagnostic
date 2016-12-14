require 'rails_helper'


describe 'NrelAddress' do
  context ".address" do
    it "returns an array of nearest gas stations by either propane or electric" do

      token = ENV['API_KEY']

      address = NrelAddress.by_address(80203, token)
      
      expect(address.first).to have_key(:station_name)
    end
  end
end
