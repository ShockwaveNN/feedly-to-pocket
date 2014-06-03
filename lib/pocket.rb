require_relative 'query'

class Pocket
  attr_accessor :consumer_key
  attr_accessor :redirect_url
  attr_accessor :access_token
  def initialize(file_with_key = 'consumer.key', redirect_url = 'example1.com')
    @consumer_key = File.open(file_with_key) {|f| f.readline}
    @redirect_url = redirect_url
  end

  def login
    key = send_post_request('https://getpocket.com/v3/oauth/request', {consumer_key: @consumer_key, redirect_uri: @redirect_url})[:code]
    `google-chrome-stable "https://getpocket.com/auth/authorize?request_token=#{key}&redirect_uri=#{@redirect_url}"`
    sleep 5
    @access_token = send_post_request("https://getpocket.com/v3/oauth/authorize", {consumer_key: @consumer_key, code: key})[:access_token]
  end

  def add_url(url)
    send_post_request("https://getpocket.com/v3/add", {url: url, consumer_key: @consumer_key, access_token: @access_token})
  end
end