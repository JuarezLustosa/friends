require './app/models/calculation_coordinate'

describe CalculationCoordinate do
  context "calculate" do
    let(:latA) {-19}
    let(:latB) {-19}
    let(:logA) {-43}
    let(:logB) {-44}
    
    describe "with coordinates" do
      before do
        def result
          CalculationCoordinate.new(latA, latB, logA, logB).calculate
        end
      end
        
      it "return a correct distance between two coordinates" do
        result.should == 1
        result.should_not == 2 
      end
    end
  end
end