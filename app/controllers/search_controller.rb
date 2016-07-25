class SearchController < ApplicationController
  include SearchHelper

  def index
  end

  def show
    @username = params[:username]
    @tweets = fetch_tweets!(@username)
    if @tweets.is_a?(Exception)
      @error = "Sorry, #{@username} does not exist."
    else
      @tweets = @tweets[0..9]
    end
  end
end