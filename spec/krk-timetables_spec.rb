require 'spec_helper'

describe KrkTimetables, :vcr do

  describe "#stops" do

    before(:each) do
      @stops = KrkTimetables.stops
    end

    it "is not empty" do
      @stops.should_not be_empty
    end

    it "should be an Array" do
      @stops.should be_a(Array)
    end

    it "should contain stops" do
      @stops.first.should be_a(KrkTimetables::Stop)
      @stops.last.should be_a(KrkTimetables::Stop)
    end

    it "should contain Cracovia and Teatr Bagatela stops" do
      stops_names = @stops.map {|stop| stop.name }
      stops_names.should include("Cracovia")
      stops_names.should include("Teatr Bagatela")
    end

  end

end
