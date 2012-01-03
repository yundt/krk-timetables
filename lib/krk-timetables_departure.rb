class KrkTimetables::Departure

  def initialize(hour_part, minute_part)
    @hour_part, @minute_part = hour_part, minute_part
  end

  def time
    "#{@hour_part}:#{@minute_part.to_s.rjust(2, "0")}"
  end
  
  def time_today
    now = Time.now

    Time.new(now.year, now.month, now.day, @hour_part, @minute_part)
  end

end
