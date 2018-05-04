require 'unirest'

system "clear"
puts
puts "Your in the Dictionary App now."
puts "=" * 32
puts

while true
  print "Enter a word: "
  input_word = gets.chomp

  puts
  puts "Definitions".center(32)
  puts "=" * 32
  puts

  response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/definitions?limit=10&includeRelated=false&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

  definitions = response.body

  definitions.each_with_index do |definition, index|
    puts "#{index + 1} - #{definition["text"]}"
    puts
  end

  response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/topExample?useCanonical=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5
  ")

  top_example = response.body

  puts
  puts "Top Example".center(32)
  puts "=" * 32
  puts

  puts top_example["text"]


  response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/pronunciations?useCanonical=true&limit=10&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5
  ")

  pronunciations = response.body

  puts
  puts "Pronounciation".center(32)
  puts "=" * 32
  puts

  pronunciations.each_with_index do |pronunciation, index|
    puts "#{index + 1} - #{ pronunciation["raw"] }"
  end

  puts
  puts "Enter q to quit, and other key to continue."
  input_option = gets.chomp
  
  if input_option == "q"
    system "clear"
    puts "Thank you for using the Dictionary App, TTFN."
    break
  end
end