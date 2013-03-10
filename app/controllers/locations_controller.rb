class LocationsController < ApplicationController
  def index
    @locations = Location.all
    respond_with @locations
  end
end
