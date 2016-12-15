require 'rails_helper'


describe 'NrelAddress' do
  context ".address" do
    it "returns an array of 10 of the  nearest gas stations by either propane or electric" do
      VCR.use_cassette("#.address") do

      address = NrelAddress.by_address(80203)
      expect(address.first.name.class).to eq(String)
      expect(address.first).to respond_to(:name)
      expect(address.first).to respond_to(:address)
      expect(address.first).to respond_to(:fuel_type)
      expect(address.first).to respond_to(:distance)
      expect(address.first).to respond_to(:access_times)
      expect(address.count).to eq(10)
      end
    end
  end
end
