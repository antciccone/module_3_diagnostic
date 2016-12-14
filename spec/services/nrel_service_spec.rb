require 'rails_helper'

describe "NrelService" do
  context "#by_zipcode" do
    it "return the nearest alternative fuel stations within a distance of a given location." do

    token = ENV['API_KEY']

    nrel = NrelService.new(token)

      expect(nrel.by_address(80203).class).to eq(Hash)
      expect(nrel.by_address(80203)).to have_key(:fuel_stations)
    end
  end
end
