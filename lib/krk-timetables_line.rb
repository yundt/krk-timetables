class KrkTimetables::Line

  attr_reader :number, :destination

  def initialize(number, destination)
    @number, @destination = number, destination
  end

end
