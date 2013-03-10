require './app/models/location_generator'

describe LocationGenerator do
  context "#make!" do            
    it "a location" do
      expect {LocationGenerator.new().make!}.to change{Location.count}.by(1)
    end
  end
end