require 'rails_helper'


describe 'NrelAddress' do
  context ".address" do
    it "returns an array of nearest gas stations by either propane or electric" do

      token = ENV['API_KEY']

      address = NrelAddress.by_address(80203, token)
      expect(address.first).to respond_to(:name)
      expect(address.first).to respond_to(:address)
      expect(address.first).to respond_to(:fuel_type)
      expect(address.first).to respond_to(:distance)
      expect(address.first).to respond_to(:access_times)
    end
  end
end
