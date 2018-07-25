require 'net/http'
require 'uri'

url = URI.parse("http://www.ruby-lang.org/ja/")
http = Net::HTTP.start(url.host) #=> http hostname: www.ruby-lang.org
doc = http.get(url.path) #=> http path: /ja/
puts doc.body