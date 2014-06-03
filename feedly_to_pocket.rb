require_relative 'lib/feedly_saved_for_later'
require_relative 'lib/pocket'


filename = '/home/shock/Downloads/FeedlySavedForLater1401814657694.txt'

feedly_saved_for_later = FeedlySavedForLater.new
feedly_saved_for_later.parse_feedly_file(filename)
urls = feedly_saved_for_later.get_url

pocket = Pocket.new
pocket.login
urls.each do |cur_url|
  pocket.add_url(cur_url)
end