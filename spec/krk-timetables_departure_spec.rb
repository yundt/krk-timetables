require 'spec_helper'

describe KrkTimetables::Departure, :vcr do

  before(:each) do
    @departure = KrkTimetables::Stop.find_by_name("Cracovia").lines.first.departures["work_weekdays"].first
  end

  describe "#time" do

    it "has a proper time attribute" do
      @departure.time.should match(/^\d?\d:\d\d$/)
    end

  end

  describe "#time_today" do

    it "is a Time object" do
      @departure.time_today.should be_a(Time)
    end

  end

end
