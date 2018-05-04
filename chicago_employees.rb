require 'unirest'

response = Unirest.get("https://data.cityofchicago.org/resource/xzkq-xp2w.json")
# puts JSON.pretty_generate(response.body)

data = response.body

data.each do |employee_hash|
  puts ""
  puts "============================"
  puts "#{employee_hash["name"]} - #{employee_hash["job_titles"]}"
end