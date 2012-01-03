require 'spec_helper'

describe KrkTimetables::Line do

  before(:each) do
    @line = KrkTimetables::Stop.find_by_name("Cracovia").lines.first
  end

  describe "#number" do

    it "is an Integer" do
      @line.number.should be_a(Integer)
    end

    it "is bigger than zero" do
      @line.number.should > 0
    end

  end

  describe "#destination" do

    it "is a String" do
      @line.destination.should be_a(String)
    end

    it "should not be blank" do
      @line.destination.should_not be_empty
    end

  end

  describe "#departures" do

    it "should be a Hash" do
      @line.departures.should be_a(Hash)
    end

    it "should not be empty" do
      @line.departures.should_not be_empty
    end

    it "should contain categorized departures" do
      expected_keys = ["work_weekdays", "saturdays", "sundays"]

      departures = @line.departures
      departures.size.should == 3
      (departures.keys & expected_keys).size.should == 3
      expected_keys.each do |key|
        @line.departures[key].should be_a(Array)
        @line.departures[key].first.should be_a(KrkTimetables::Departure)
        @line.departures[key].last.should be_a(KrkTimetables::Departure)
      end
    end

  end

end
