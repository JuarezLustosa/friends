class CalculationCoordinate
  def initialize(latA, latB, logA, logB)
    @latA = latA
    @latB = latB
    @logA = logA
    @logB = logB
  end
  
  def calculate
    latitude  = sum_coordinate(@latA, @latB) if positive(@latA, @latB)
    longitude = sum_coordinate(@logA, @logB) if positive(@logA, @logB)
    
    latitude  = subtract_coordinate(@latA, @latB) if negative(@latA, @latB)
    longitude = subtract_coordinate(@logA, @logB) if negative(@logA, @logB)
    
    (latitude + longitude).abs
  end
  
  def sum_coordinate(coordinateA, coordinateB)
    coordinateA.abs + coordinateB.abs
  end
  
  def subtract_coordinate(coordinateA, coordinateB)
    coordinateA.abs - coordinateB.abs
  end
  
  def negative(coordinateA, coordinateB)
    coordinateA > 0 && coordinateB > 0 || 
    coordinateA < 0 && coordinateB < 0
  end
  
  def positive(coordinateA, coordinateB)
    coordinateA > 0 && coordinateB < 0 || 
    coordinateA < 0 && coordinateB > 0
  end
end