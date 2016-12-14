class NrelService

  def initialize(token)
    @token = token
    @url = "http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?"
  end

  def by_address(address)
    by_address_json = Faraday.get("#{url}api_key=#{token}&location=#{address}")
    json_parse(by_address_json)
  end

  def json_parse(json)
    JSON.parse(json.body, symbolize_names: true)[:fuel_stations]
  end

  private

    attr_reader :token, :url
end
