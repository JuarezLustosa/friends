require 'spec_helper'

describe LocationsController do
  let(:location) { Location.all.sort }
  
  describe "GET index" do
    it "assigns all locations as @locations" do
      get :index
      assigns(:locations).should eq(location)
    end
  end
end
