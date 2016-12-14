class NrelAddress

  attr_reader
  def initialize(service={})
    @name         = service[:station_name]
    @address      = service[:street_address]
    @fuel_type    = service[:fuel_type_code]
    @distance     = service[:distance]
    @access_times = service[:access_days_time]
  end

  def self.by_address(address, token)
      NrelService.new(token).by_address(address).map do |nrel_raw|
      NrelAddress.new(nrel_raw)
    end
  end
end
