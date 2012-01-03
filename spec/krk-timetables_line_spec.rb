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

end
