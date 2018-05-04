require 'unirest'

response = Unirest.get("https://www.reddit.com/r/programming/.json")
index = 0

10.times do 
  title = response.body["data"]["children"][index]["data"]["title"]
  p title
  index += 1
end

