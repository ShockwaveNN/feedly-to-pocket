require 'net/http'
require 'net/https'
require 'openssl'
require 'uri'
require 'json'

def send_post_request(url, hash_parameters)
  url = URI.parse(url)
  request = Net::HTTP::Post.new(url.request_uri)
  request.set_form_data(hash_parameters)
  http = Net::HTTP.new(url.host, url.port)
  http.read_timeout = 200
  http.use_ssl = true
  response = http.request(request)
  begin
    JSON.parse(response.body)
  rescue Exception
    URI.decode_www_form(response.body).inject({}) { |r, (key, value)| r[key.to_sym] = value; r }
  end
end
