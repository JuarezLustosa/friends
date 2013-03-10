class Location < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :my_location, :address
  
  scope :where_ami, where(:my_location => 'Here')
  scope :visited, where(:my_location => 'visited')
  scope :not_visited, where(:my_location => nil)
  
  def self.closet_to_me
    my_location = where_ami.first
    Geo.new(my_location, not_visited).find_close_by_coordinates
  end
  
  def self.three_close_to_me
    closet_to_me.first(3).map {|location| location[:location_id]}
  end
end
