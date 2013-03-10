class LocationsController < ApplicationController
  before_filter :destroy_all, :only => [:index]
  before_filter :automatic_generate_locations, :only => [:index]

  def index    
    @locations = Location.all
    @locations.first.update_attributes(:my_location => 'Here')
    respond_with @locations
  end
  
  private  
  def destroy_all
    Location.destroy_all  
  end
      
  def automatic_generate_locations
    5.times{ LocationGenerator.new().make! }
  end
end
