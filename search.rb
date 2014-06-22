require 'net/http'
require 'uri'
require 'twitter'

def run
  @client = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = ENV['consumer_key']
    config.consumer_secret     = ENV['consumer_secret']
    config.access_token        = ENV['access_token']
    config.access_token_secret = ENV['access_token_secret']
  end

  @client.user do |obj|
    next unless obj.is_a?(Twitter::Tweet)
    next unless obj.text =~ Regexp.new(ENV['query'])
    notify_tweet(obj)
  end
end

def notify_tweet(tweet)
  uri = URI.parse("https://new.boxcar.io/api/notifications")
  options = {
    "user_credentials" => ENV['boxcar_access_token'],
    "notification[title]" => "@#{tweet.user.screen_name}: #{tweet.text}",
    "notification[long_message]" => "<a href='http://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}'>View in Web</a>",
    "notification[sound]" => "bird-1",
    "notification[source_name]" => "tweet_search"
   }
   Net::HTTP.post_form(uri, options)
end

run()
