module SearchHelper
  def fetch_tweets!(username)
    tweets = []
    api_response = $twitter.user_timeline(username)
  rescue => error
    return error
    api_response.each do |tweet|
      tweets << {text: tweet[:text], created_at: tweet[:created_at]}
    end
    return tweets
  end
end