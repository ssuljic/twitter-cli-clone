require 'colored'

module TwitterFeed
  class TweetWriter
    URI_REGEX = /http(s)?:\/\/[a-zA-Z\d\.\/_]+/

    def write(tweet)
      text = "#{tweet.user.name.cyan}: #{tweet.text}\n\n"
      text.gsub!(URI_REGEX) { |url| url.red }
      puts text
    end
  end
end