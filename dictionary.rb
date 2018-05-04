# word’s definition, top example, and pronunciation

require 'unirest'

system "clear"
puts "Welcome to the dictionary!"

while true 

print "Please enter word: "
word = gets.chomp

  response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/definitions?limit=200&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5") # this is definition
  response_2 = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/topExample?useCanonical=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")  # this is for top example

  response_3 = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5") # this is for pronounciation

  word_data = response.body
  word_definition = word_data[1]["text"]

  word_data_2 = response_2.body
  word_top_example = word_data_2["text"]

  word_data_3 = response_3.body
  word_pronunciation = word_data_3[0]["raw"]

  puts "The definition of #{word} is #{word_definition}"
  puts "The top example of #{word} is '#{word_top_example}'"
  puts "The pronunciation of #{word} is #{word_pronunciation}"


  puts
  puts
  puts "Enter q to quit, any other key to continue"
  user_option = gets.chomp

  if user_option == "q"
    system "clear"
    puts "Thanks, bye now"
    break
  end
end
