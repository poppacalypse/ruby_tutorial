require 'date' # Technically not necessary as Sinatra already requires date

# Returns the day of the week for the given Time object. (Example 2)
def day_of_the_week(time)
  Date::DAYNAMES[time.wday]
end

# Returns a friendly greeting.
def greeting(time)
  "Example 3: So say we all, on this glorious #{day_of_the_week(Time.now)}."
end
