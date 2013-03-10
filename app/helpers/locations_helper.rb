module LocationsHelper
  def colorize_by_distance(location)
    if location.my_location == 'Here'
      "where_iam"
    else
      "closer" if has_include_ids?(location)
    end
  end
  
  def has_include_ids?(location)
    close_ids = Location.three_close_to_me
    close_ids.include? location.id and location.my_location != 'visited'
  end  
end
