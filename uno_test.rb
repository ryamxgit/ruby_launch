
require 'uri'
require 'net/http'
require 'openssl'

PRIV_APIKEY='806b1a0cacmshe2a06f84897b2c7p196e4cjsned53ee3f434e'

require 'uri'
require 'net/http'
require 'openssl'
require 'json'

url = URI("https://imdb-top-100-movies.p.rapidapi.com/")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = PRIV_APIKEY
request["X-RapidAPI-Host"] = 'imdb-top-100-movies.p.rapidapi.com'

response = http.request(request)
i = 0
data = JSON.parse response.read_body
data.each do |movie|
  puts movie["rank"].to_s+". "+movie["title"]
  
end 
