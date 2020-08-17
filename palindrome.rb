# ================== Ch 7.5: Modules - Exercise ============
# Make it a reusable module by separating palindrome_tutorial.rb into 3 files: palindrome.rb, string_palindrome.rb, and integer_palindrome.rb , and `include` the module into the corresponding files using `require`

module Palindrome

  # Returns true for a palindrome, false otherwise.
  def palindrome?
    processed_content == processed_content.reverse
  end

  private

    # Returns content for palindrome testing.
    def processed_content
      to_s.downcase
    end

end
