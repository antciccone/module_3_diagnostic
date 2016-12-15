class NrelService

  def initialize
    @conn = Faraday.new(url: "http://developer.nrel.gov") do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params[:api_key] = ENV['API_KEY']
    end
  end

  def by_address(address)
    by_address_json = conn.get "api/alt-fuel-stations/v1/nearest.json?location=#{address}&fule_type=ELEC,LPG&limit=10"
    json_parse(by_address_json.body)[:fuel_stations]
  end

  def json_parse(json)
    JSON.parse(json, symbolize_names: true)
  end

  private

    attr_reader :url, :conn, :url
end
