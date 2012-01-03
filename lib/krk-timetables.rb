require "krk-timetables/version"
require "krk-timetables_stop"
require "nokogiri"
require "open-uri"

module KrkTimetables

  STOPS_URL = "http://rozklady.mpk.krakow.pl/aktualne/przystan.htm"

  def KrkTimetables.stops
    doc = Nokogiri::HTML(open(STOPS_URL))
    stops = []

    doc.css('table li a').each do |stop_link|
      stops << Stop.new(stop_link.content)
    end

    stops
  end

end
