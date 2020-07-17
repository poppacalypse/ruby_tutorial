# Returns true for a palindrome, false otherwise

def palindrome? rentetan
  processed_content = rentetan.downcase
  processed_content == processed_content.reverse
end

# Exercise: Using method chaining, write a function email_parts to return an array of the username and domain for a standard email address of the form username@example.com. Note: Make sure your function returns the same result for USERNAME@EXAMPLE.COM.

def email_parts emel
  emel.downcase.split("@")
end
