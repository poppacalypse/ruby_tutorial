require 'sinatra'
require './day'

# Example 1 - build our own array of day daynames

# NAMAHARI = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
#
# get '/' do
#   hari = NAMAHARI[Time.now.wday]
#   "Example 1: Hello darkness! Happy #{hari}."
# end

# ------------------------------------

# Example 2 - use the Date class, function defined in day.rb

# get '/' do
#   "Example 2: Hello darkness my old frand. Happy #{day_of_the_week(Time.now)} <3"
# end

# ------------------------------------

# Example 3 - replace the interpolated string in Ex.2 with a greeting function

# get '/' do
#   greeting(Time.now)
# end

# ------------------------------------

# Example 4 - back to basics (my own example)

get '/' do
  "Example 4: Hello hello #{Date::DAYNAMES[Time.now.wday]}"
end
