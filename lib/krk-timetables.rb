require "nokogiri"
require "open-uri"

require "krk-timetables/version"
require "krk-timetables_stop"
require "krk-timetables_line"

module KrkTimetables

  URL_PREFIX = "http://rozklady.mpk.krakow.pl/aktualne/"
  STOPS_PATH = "przystan.htm"

  def KrkTimetables.stops
    doc = Nokogiri::HTML(open(URL_PREFIX + STOPS_PATH))
    stops = []

    doc.css('table li a').each do |stop_link|
      stops << Stop.new(stop_link.content, stop_link.attributes["href"].value)
    end

    stops
  end

end
