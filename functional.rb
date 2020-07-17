states = ["Kansas", "Nebraska", "North Dakota", "South Dakota"]

# Example 1 - urls: Imperative version
# def imperative_urls states
#   urls = []
#   states.each do |state|
#     urls << state.downcase.split.join("-")
#   end
#   urls
# end
#
# p imperative_urls states

# -----------------------------

# Example 2 - urls: Functional version
# def functional_urls states
#   states.map { |state| state.downcase.split.join("-") }
# end
#
# p functional_urls states

# -----------------------------

# Example 3 - Returns a URL-friendly version of a string
# e.g. "North Dakota" -> "north-dakota"
def urlify string
  string.downcase.split.join("-")
end

# Example 3A - urlified: Imperative version

# def imperative_urls states
#   urls = []
#   states.each do |state|
#   urls << urlify(state) # parentheses required in this case
#   end
#   urls
# end
#
# p imperative_urls states

# Example 3B - urlified: Functional version

# def functional_urls states
#   states.map { |state| urlify(state) }
# end
#
# p functional_urls states

# Exercise: Using map, write a function that takes in the states variable and returns an array of URLs of the form https://example.com/<urlified form>.

# Answer 1: We could do it this way, using the urlify(string) function that we've already defined in Example 3, and modifying the second function to include the URL format:

# def urlified_form states
#   states.map { |state| "https://example.com/#{urlify(state)}" }
# end
#
# puts urlified_form states

# Answer 2: Or, we could modify the first function instead, and pass it to the 2nd function:

def urlified string
  "https://example.com/#{string.downcase.split.join('-')}"
end

def urlified_form2 states
  states.map { |negeri| urlified(negeri) }
end

puts urlified_form2 states
