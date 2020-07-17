def sandwich
  puts "top bread"
  yield
  puts "bottom bread"
end

sandwich do
  puts "bacon, lettuce, and tomato"
end

def tag tagname, text
    html = "<#{tagname}>#{text}</#{tagname}>"
    yield html
end

tag "p", "Lorem ipsum" do |markup|
  puts markup
end

def drunkensong
  5.downto(2) { |n| puts "#{n} bottles of beer on the wall"}
  yield
end

drunkensong do
  puts "1 bottle of beer on the wall"
end

def bad_sandwich(contents)
  puts "bad top bread"
  puts contents
  puts "bad bottom bread"
end

bad_sandwich("mutton, lettuce, and tomato")
