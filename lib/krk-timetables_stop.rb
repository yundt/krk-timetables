class KrkTimetables::Stop
  
  attr_reader :name

  def initialize(name, url)
    @name, @lines, @url = name, [], url
  end

  def self.find_by_name(name)
    KrkTimetables.stops.select { |stop| stop.name == name }.first
  end

  def lines
    return @lines unless @lines.empty?

    doc = Nokogiri::HTML(open(KrkTimetables::URL_PREFIX + @url))

    doc.css("table li a").each do |line_link|
      line_link_data = line_link.content.split(" - > ")
      next unless line_link_data.size == 2

      number = line_link_data.first.to_i
      destination = line_link_data.last
      url = line_link.attributes["href"].value

      @lines << KrkTimetables::Line.new(number, destination, url)
    end

    @lines
  end

end
