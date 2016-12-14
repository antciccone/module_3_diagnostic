require 'rails_helper'

describe "NrelService" do
  context "#by_zipcode" do
    it "return the nearest alternative fuel stations within a distance of a given location." do
      VCR.use_cassette("#by_zipcode") do
        token = ENV['API_KEY']

        nrel = NrelService.new(token)

        expect(nrel.by_address(80203).class).to eq(Array)
        expect(nrel.by_address(80203).first).to have_key(:street_address)
        expect(nrel.by_address(80203).first).to have_key(:fuel_type_code)
        expect(nrel.by_address(80203).first).to have_key(:access_days_time)
        expect(nrel.by_address(80203).first).to have_key(:distance)
        expect(nrel.by_address(80203).first).to have_key(:station_name)
      end
    end
  end
end
