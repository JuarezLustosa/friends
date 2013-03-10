require 'spec_helper'

describe Location do
  let(:attributes) {stub(:longitude => 10, :latitude => 20) }
  let(:location) { Location.new(:longitude => 10, :latitude => 20) }
  let(:my_location) { stub([Location, :my_location => 'Here'])}
  let(:not_visited) { stub([Location, :my_location => nil])}
  let(:location_saved) { stub(errors: {base: [],
                                         bed_id: [],
                                         patient_id: []}).as_null_object }
  
  
  context "validations" do
    it "should be valid" do
      location.should be_valid
    end
  end
  
  def save_location!
    location_saved = location.save!
  end
  
  context "#close_to_me" do    
    it "should return who is close to me" do
      location_saved.stub(:where_ami).and_return(my_location)
      location_saved.stub(:not_visited).and_return(not_visited)
      location_saved.closet_to_me.should be(location_saved)
    end
  end
  
  context "#three_close_to_me" do
    it "return three ids where more close to my location" do
      location_saved.stub(:find_close_by_coordinates).and_return(location_saved)
      location_saved.three_close_to_me.should be(location_saved)
      save_location!
    end
  end
end
