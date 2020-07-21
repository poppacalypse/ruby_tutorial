states = ["Kansas", "Nebraska", "North Dakota", "South Dakota"]

# ==================== .map ====================

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

# Example 3A - urlify: Imperative version

# def imperative_urls states
#   urls = []
#   states.each do |state|
#   urls << urlify(state) # parentheses required in this case
#   end
#   urls
# end
#
# p imperative_urls states

# -----------------------------

# Example 3B - urlify: Functional version

# def functional_urls states
#   states.map { |state| urlify(state) }
# end
#
# p functional_urls states

# -----------------------------

# Example 3C - using synonymous .collect in place of .map

# def functional_select_urls states
#   states.collect { |state| urlify(state)}
# end
#
# p functional_select_urls states

# -----------------------------

# .map Exercise: Using map, write a function that takes in the states variable and returns an array of URLs of the form https://example.com/<urlified form>.

# Answer 1: We could do it this way, using the urlify(string) function that we've already defined in Example 3, and modifying the second function to include the URL format:

# def urlified_form states
#   states.map { |state| "https://example.com/#{urlify(state)}" }
# end
#
# puts urlified_form states

# Answer 2: Or, we could modify the first function instead, and pass it to the 2nd function:

# def urlified string
#   "https://example.com/#{string.downcase.split.join('-')}"
# end
#
# def urlified_form2 states
#   states.map { |negeri| urlified(negeri) }
# end
#
# puts urlified_form2 states


# ==================== .select ====================

# Example 1 - singles: Imperative version
# def imperative_singles states
#   singles = []
#   states.each do |state|
#     if state.split.length == 1
#       singles << state
#     end
#   end
#   singles
# end

# puts imperative_singles(states).inspect # parentheses necessary to use .inspect. Otherwise easier to just use p

# p imperative_singles states

# -----------------------------

# Example 2 - singles: Functional version
def functional_singles states
  states.select { |state| state.split.length == 1 }
end

p functional_singles states

# -----------------------------

# Example 3 - using antonymous .reject in place of .select (synonymous would be .find_all)

def functional_find_all_singles states
  states.find_all { |state| state.split.length == 1 }
end

p functional_find_all_singles states

def functional_reject_singles states
  states.reject { |state| state.split.length > 1 }
end

p functional_reject_singles states
# -----------------------------

# .select Exercise: Write two select functions that return the Dakotas: one using String#include? to test for the presence of the string “Dakota” and one that tests for the length of the split array being 2.

# def has_dakota states
#   states.select { |state| state.include? "Dakota" }
# end
#
# p has_dakota states
#
# def two_word states
#   states.select { |negeri| negeri.split.length == 2 } # or .length > 1
# end
#
# p two_word states

# ==================== .reduce ====================

numbers = 1..10

# Example 1 - sum: Imperative version
# def imperative_sum numbers
#   total = 0
#   numbers.each do |n|
#     total += n
#   end
#   total
# end
#
# puts imperative_sum numbers

# -----------------------------

# Example 2 - sum: Functional version

# def functional_sum numbers
#   numbers.reduce { |total, n| total + n }
# end
#
# puts functional_sum numbers

# -----------------------------

# Example 2A - using synonymous .inject in place of .reduce
# def functional_inject_sum numbers
#   numbers.inject { |total, n| total + n }
# end
#
# puts functional_inject_sum numbers

# -----------------------------

# Example 3 - lengths: Imperative solution
def imperative_lengths states
  character_count = {}
  states.each do |state|
    character_count[state] = state.length
  end
  character_count
end

puts imperative_lengths states

# -----------------------------

# Example 4 - lengths: Functional solution
# def functional_lengths states
#   states.reduce({}) do |lengths, state|
#     lengths[state] = state.length
#     lengths
#   end
# end
#
# puts functional_lengths states

# Example 4A - using .inject in place of .reduce
# def functional_inject_lengths states
#   states.inject({}) do |lengths, state|
#     lengths[state] = state.length
#     lengths
#   end
# end
#
# puts functional_inject_lengths states
# -----------------------------

# Example 5 - lengths: Functional, single-line solution
# def compact_functional_lengths states
#   states.reduce({}) { |lengths, state| lengths[state] = state.length; lengths }
# end
#
# puts compact_functional_lengths states
