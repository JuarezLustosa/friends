require 'spec_helper'

describe ChangeLocationsController do
  let(:location_changed) { Location.all }
  
  describe "GET index" do
    it "assigns all changed locations as @locations" do
      get :index
      assigns(:locations).should eq(location_changed)
    end
  end
end
