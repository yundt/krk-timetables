require 'spec_helper'

describe KrkTimetables::Stop do

  describe "#find_by_name" do

    it "can find Cracovia and Teatr Bagatela stops" do
      cracovia = KrkTimetables::Stop.find_by_name("Cracovia")
      cracovia.should_not be_nil
      cracovia.should be_a(KrkTimetables::Stop)
      cracovia.name.should == "Cracovia"

      teatr_bagatela = KrkTimetables::Stop.find_by_name("Teatr Bagatela")
      teatr_bagatela.should_not be_nil
      teatr_bagatela.should be_a(KrkTimetables::Stop)
      teatr_bagatela.name.should == "Teatr Bagatela"
    end

    it "can't find The Stop That Does Not Exist" do
      KrkTimetables::Stop.find_by_name("The Stop That Does Not Exist").should be_nil
    end

  end

  describe "#lines" do

    before(:each) do
      @stop = KrkTimetables::Stop.find_by_name("Cracovia")
      @lines = @stop.lines
    end

    it "is an Array" do
      @lines.should be_a(Array)
    end

    it "is not empty" do
      @lines.should_not be_empty
    end

    it "should contain lines" do
      @lines.first.should be_a(KrkTimetables::Line)
      @lines.last.should be_a(KrkTimetables::Line)
    end

    it "should contain a 164 line" do
      @lines.select { |line| line.number == 164 }.should_not be_empty
    end

  end

end
