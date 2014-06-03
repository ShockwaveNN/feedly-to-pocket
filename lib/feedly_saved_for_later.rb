require_relative 'query'

class FeedlySavedForLater
  attr_accessor :json_content
  def parse_feedly_file(file)
    @json_content = JSON.parse( IO.read(file))
  end

  def get_url
    urls = []
    @json_content.each do |cur|
      urls << cur['url']
    end
    urls
  end
end
