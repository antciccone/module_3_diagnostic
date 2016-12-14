class NrelService

  attr_reader :token
  def initialize(token)
    @token = token
  end

  def by_address(address)
    by_address_json = Faraday.get("http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{token}&location=#{address}")
    JSON.parse(by_address_json.body, symbolize_names: true)[:fuel_stations]
  end
end
