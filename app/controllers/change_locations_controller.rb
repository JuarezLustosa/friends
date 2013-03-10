class ChangeLocationsController < ApplicationController
  before_filter :find_locations, :my_location, :only => [:index]
  
  def index
    change_my_location(@locations, @my_location)
    respond_to do |format|
      format.js
    end
  end


  private
  def find_locations
    @locations  = Location.scoped
  end
  
  def my_location
    @my_location = Location.where_ami.first
  end
  
  def change_my_location(locations, my_location)
    if locations.present?
      locations_unvisted = locations.not_visited
      move_to(locations_unvisted.first, my_location)
    end
  end
  
  def move_to(location, my_location)
    location.update_attributes(:my_location => 'Here') if location.present?
    my_location.update_attributes(:my_location => 'visited') if my_location.present?
  end
end