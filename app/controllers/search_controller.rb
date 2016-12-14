class SearchController < ApplicationController

  def index
    @by_address = NrelAddress.by_address(params[:q], ENV['API_KEY'])
  end
end
