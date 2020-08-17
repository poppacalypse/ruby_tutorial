# ================ Functions and blocks ======================
# ================ Ch 5.3: Method chaining ==============

# Returns true for a palindrome, false otherwise

# def palindrome? rentetan
#   processed_content = rentetan.downcase
#   processed_content == processed_content.reverse
# end

# Exercise: Using method chaining, write a function email_parts to return an array of the username and domain for a standard email address of the form username@example.com. Note: Make sure your function returns the same result for USERNAME@EXAMPLE.COM.

# def email_parts emel
#   emel.downcase.split("@")
# end

# ================== Objects and classes ======================
# ================== Ch 7.1: Defining classes ============

# Defines a Phrase class

# class Frasa
#   attr_accessor :kandungan # attribute accessor. Setter method that allows us to 'set' (assign) the given attribute
#
#   def initialize kontent
#     @kandungan = kontent # @kandungan = instance variable, a way to represent this phrase, in a way that can be accessed throughout the object
#   end
#
#   # Returns true for a palindrome, false otherwise (taken from 5.3)
#   def palindrome? # we don't need rentetan bcoz we already know what the string is
#     # processed_content = @kandungan.downcase # way 1
#     # processed_content = self.kandungan.downcase # way 2: more common way than the above, where self refers to the @instance_variable, i.e. object instance. Similar to JS 'this'. It's not wrong to include it, and easier to have it at the beginning. Commonly used when we want to assign the kandungan. Otherwise, we can leave it off ↓
#     processed_content = kandungan.downcase
#
#     processed_content == processed_content.reverse
#   end
# end

# clean version:

# class Phrase
#   attr_accessor :kandungan # set
#
#   def initialize kontent # initialize = new
#     @kandungan = kontent
#   end
#
#   # Returns true for a palindrome, false otherwise
#   def palindrome?
#     processed_content = self.kandungan.downcase # get
#     processed_content == processed_content.reverse
#   end
#
#   # Makes the phrase LOUDER.
#   def louder
#     content.upcase
#   end
# end

# phrase = Frasa.new "Madam, I'm Adam"
# puts phrase.kandungan # attribute i.e. data. Getter method that allows us to 'get' (access) the given attribute.
#
# phrase.kandungan = "Able was I, ere I saw Elba."
# puts phrase.kandungan

# phrase = Phrase.new "Madam I'm Adam"
# puts phrase.content
#
# phrase.content = "Able was I, ere I saw Elba"
# puts phrase.content


# ================== Ch 7.2: Inheritance ============

# class Phrase < String # Phrase inherits from String, i.e. Phrase is a String
#
#   # bc Phrase is a String, we can use the initialize method on String itself, so there is no need for attr_accessor and def initialize
#
#   # Returns true for a palindrome, false otherwise
#   def palindrome?
#     processed_content = self.downcase # bc Phrase is a String, self refers to a string, and we can downcase it directly. We can also eliminate self
#     processed_content == processed_content.reverse
#   end
#
#   # Makes the phrase LOUDER.
#   def louder
#     self.upcase
#   end
# end

# bc Phrase is a String, we can call any of the string methods on it for free, e.g. phrase.empty? phrase.length phrase.include?("a") phrase.scan(/c\w/) etc.

# clean version, and without 'self': Note how weird upcase looks -

# class Phrase < String
#
#   def palindrome?
#     processed_content = downcase
#     processed_content == processed_content.reverse
#   end
#
#   def louder
#     upcase
#   end
# end

# ================== Ch 7.3: Derived classes ============

# class Phrase < String
#
#   # Returns content for palindrome testing.
#   def processed_content # factor processed_content into a separate method
#     self.downcase
#   end
#
#   # Returns true for palindrome, false otherwise.
#   def palindrome?
#     processed_content == processed_content.reverse
#   end
#
#   def louder
#     self.upcase
#   end
#
# end
#
# # Defines a translated Phrase.
# class TranslatedPhrase < Phrase # TranslatedPhrase inherits from Phrase
#                                 # or, TranslatedPhrase is a Phrase
#   attr_accessor :terjemahan
#
#   def initialize kontent, translation # e.g. TranslatedPhrase.new "recognise", "reconocer"
#     super kontent
#     @terjemahan = translation
#   end
#
#   # Processes the translation for palindrome testing.
#   def processed_content # bc we factored processed_content into a separate method, we can override it here
#     self.terjemahan.downcase
#   end
#
# end

# 7.3 Exercise
# Both Phrase and TranslatedPhrase have explicit calls to the downcase method. Eliminate this duplication by filling defining an appropriate processor method that returns the lower-case version of the content.

# Defines a Phrase class (inheriting from String).
# class Phrase < String
#
#   # Processes the string for palindrome testing.
#   def processor rentetan
#     rentetan.downcase
#   end
#
#   # Returns content for palindrome testing.
#   def processed_content
#     processor self
#   end
#
#   def louder
#     upcase
#   end
#
#
#   # Returns true for a palindrome, false otherwise.
#   def palindrome?
#     processed_content == processed_content.reverse
#   end
# end
#
#
# # Defines a translated Phrase.
# class TranslatedPhrase < Phrase
#   attr_accessor :terjemahan
#
#   def initialize kontent, translation
#     super kontent
#     @terjemahan = translation
#   end
#
#   # Processes the translation for palindrome testing.
#   def processed_content
#     processor terjemahan
#   end
# end


# ================== Ch 7.4: Modifying native objects ============

# class String
#
#   # Returns true for a palindrome, false otherwise.
#   def palindrome?
#     processed_content == processed_content.reverse
#   end
#
#   # Returns true if the string is empty, false otherwise
#   def blank?
#     match? /^\s*$/   # alternative: !!match(/^\s*$/)
#   end
#
#   def louder
#     upcase
#   end
#
#   private
#
#     # Returns content for palindrome testing.
#     def processed_content
#       downcase
#     end
#
# end


# ================== Ch 7.5: Modules ============

module Palindrome

  # Returns true for a palindrome, false otherwise.
  def palindrome?
    processed_content == processed_content.reverse
  end

  private

    # Returns content for palindrome testing.
    def processed_content
      self.to_s.downcase
    end

end

class String
  include Palindrome
end

class Integer
  include Palindrome
end
