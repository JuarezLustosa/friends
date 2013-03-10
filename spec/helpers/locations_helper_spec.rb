require 'spec_helper'

describe LocationsHelper do
  let(:my_location) { stub_model(Location, :my_location => "Here") }
  let(:visited) { stub_model(Location, :my_location => nil) }

  describe "#colorize_by_distance" do
    it "return string where_iam, with my_location is Here" do
      colorize_by_distance(my_location).should eq("where_iam")
    end
  end
end
