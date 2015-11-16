require 'tweetstream'

module TwitterFeed
  class Feed
    def start
      TweetStream.configure do |config|
        config.consumer_key       = ENV['CONSUMER_KEY']
        config.consumer_secret    = ENV['CONSUMER_SECRET']
        config.oauth_token        = ENV['OAUTH_TOKEN']
        config.oauth_token_secret = ENV['OAUTH_TOKEN_SECRET']
        config.auth_method        = :oauth
      end

      client = TweetStream::Client.new
      writer = TweetWriter.new

      client.userstream do |tweet|
        writer.write(tweet)
      end
    end
  end
end
