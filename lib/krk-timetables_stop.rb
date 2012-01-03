class KrkTimetables::Stop
  
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.find_by_name(name)
    KrkTimetables.stops.select { |stop| stop.name == name }.first
  end

end
