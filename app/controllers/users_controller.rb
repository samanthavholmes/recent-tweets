class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find_or_create_by(username: params[:search][:username])
    if @user.tweets.empty?
      @user.fetch_tweets!
    end
    @tweets = @user.tweets.limit(10)
  end
end
