class SearchController < ApplicationController

  def index
    @by_address = NrelAddress.address(params[:q])
  end
end
