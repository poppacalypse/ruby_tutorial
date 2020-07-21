# ==================== Functions and blocks ====================
# ==================== Ch 5.3: Method chaining ====================

# Returns true for a palindrome, false otherwise

# def palindrome? rentetan
#   processed_content = rentetan.downcase
#   processed_content == processed_content.reverse
# end

# Exercise: Using method chaining, write a function email_parts to return an array of the username and domain for a standard email address of the form username@example.com. Note: Make sure your function returns the same result for USERNAME@EXAMPLE.COM.

# def email_parts emel
#   emel.downcase.split("@")
# end

# ==================== Objects and classes ====================
# ==================== Ch 7.1: Defining classes ====================

# Defines a Phrase class

class Frasa
  attr_accessor :kandungan # attribute accessor. Setter method that allows us to 'set' (assign) the given attribute

  def initialize kontent
    @kandungan = kontent # @kandungan = instance variable, which is available to use everywhere in the object
  end

  # Returns true for a palindrome, false otherwise (taken from 5.3)
  def palindrome? # we don't need rentetan bcoz we already know what the string is
    # processed_content = @kandungan.downcase
    # processed_content = self.kandungan.downcase # more common way, where self refers to the @instance_variable, i.e. object instance. Similar to JS 'this'. It's not wrong to include it, and easier to have it at the beginning. Commonly used when we want to assign the kandungan. Otherwise, we can leave it off ↓
    processed_content = kandungan.downcase
    processed_content == processed_content.reverse
  end
end

# phrase = Frasa.new "Madam, I'm Adam"
# puts phrase.kandungan # attribute i.e. data. Getter method that allows us to 'get' (access) the given attribute.
#
# phrase.kandungan = "Able was I, ere I saw Elba."
# puts phrase.kandungan
