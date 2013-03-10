class LocationGenerator
  def initialize
  end
  
  def make!
    location_create
  end

  def randon_latitude
    -23.12 + Random.rand(5.1)
  end
  
  def randon_longitude
    -50.12 + Random.rand(7.1)
  end
  
  def location_create
    Location.create(:latitude => randon_latitude, :longitude => randon_longitude)
  end
end