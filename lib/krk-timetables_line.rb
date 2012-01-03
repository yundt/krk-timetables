class KrkTimetables::Line

  attr_reader :number, :destination

  def initialize(number, destination, url)
    @number, @destination, @departures = number, destination, {}

    # the following "r" to "t" substitution is needed to get the right page without any frames
    @url = url.gsub(/r|\.\.\//, "r" => "t", "../" => "")
  end

  def departures
    return @departures unless @departures.empty?

    departure_types = ["work_weekdays", "saturdays", "sundays"]
    departure_types.each do |type|
      @departures[type] = []
    end

    doc = Nokogiri::HTML(open(KrkTimetables::URL_PREFIX + @url))

    doc.css("table table tr").each do |row|
      next if (cells = row.css("td")).size == 3

      hour = nil

      cells.each_with_index do |cell, cell_index|
        if (hour_cell = cell.css("b").first)
          hour = hour_cell.content
        elsif not (minutes = cell.content.split).empty?
          minutes.each do |minute|
            next if minute == "-"

            type = departure_types[cell_index/2]

            @departures[type] << KrkTimetables::Departure.new(hour.to_i, minute.to_i)
          end
        end
      end
    end

    @departures
  end
end
