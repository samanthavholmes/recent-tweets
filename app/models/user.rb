class User < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets!
    api_response = $twitter.user_timeline(self.username)
    api_response.each do |tweet|
      self.tweets << Tweet.find_or_create_by(text: tweet[:text], date_tweeeted_on: tweet[:created_at])
    end
    self.save
  end
end
