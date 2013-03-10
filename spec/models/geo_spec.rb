require './app/models/geo'

describe Geo do
  context "coordinates" do
    let(:locations) {
      [stub(:id => 1, :latitude => -19, :longitude => -20),
       stub(:id => 2, :latitude => -19, :longitude => -42),
       stub(:id => 3, :latitude => -25, :longitude => -12)]
    }    

    let(:my_location) { stub(:my_location => 'Here', :latitude => -19, :longitude => -43) }
    
    let(:result_ordered) { stub 
      [{:location_id=>2, :distance=>1}, 
       {:location_id=>1, :distance=>23},
       {:location_id=>3, :distance=>25}] 
    }
    
    describe "return a array" do
      before do
        def result
          Geo.new(my_location, locations).find_close_by_coordinates
        end
      end
      
      it "ordened by distance" do
        result.should eq(result_ordered)
      end
    end
  end
        
end