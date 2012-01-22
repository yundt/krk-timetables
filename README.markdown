# krk-timetables

A gem parsing Cracow MPK timetables from the mpk.krakow.pl website and returning them in a form of nice Ruby objects.

[![Build Status](https://secure.travis-ci.org/yundt/krk-timetables.png)](http://travis-ci.org/yundt/krk-timetables)

## Installation

To install the gem, use the following command:  

```
$ gem install krk-timetables
```

If you work on a Ruby on Rails application, add this to your Gemfile:  

```ruby
gem 'krk-timetables'
```  

...and run `bundle install`.

## Usage

If you don't use Rails or bundler, be sure to require the gem:  

```ruby
require 'rubygems'  
require 'krk-timetables'
```  

Now you can get the list of all Cracow stops:  

```ruby
stops = KrkTimetables.stops  
stops.size # => 1308
stops.first.name # => "Agatowa"
```

Find a stop by its name and get its lines, each with its number, destination and type (bus or tram):  

```ruby
lines = KrkTimetables::Stop.find_by_name("Cracovia").lines  
line = lines.first  
line.number # => 15  
line.destination # => "Cichy Kacik"  
line.type # => "tram"  
```

For each line, you can get its departures in a form of hash with three keys: `work_weekdays`, `saturdays` and `sundays`. For each departure, you can get its time in form of a string or a Time object for today's departure (useful for comparisons):  

```ruby
line = cracovia = KrkTimetables::Stop.find_by_name("Cracovia").lines.first  
departure = line.departures["work_weekdays"].first  
departure.time # => "5:56"  
departure.time_today # => 2012-01-21 05:56:00 +0100
```

## Compatibility

The gem has been tested with Ruby 1.9.2 and 1.9.3.

## MPK terms of use

Using the krk-timetables gem is just another way of accessing
information from mpk.krakow.pl, so any MPK terms of use apply here as
well.

## TODO

* understanding departures with special symbols (like "9.49A", where "A" is explained below the timetable),
* getting timetables' validity date ranges.
