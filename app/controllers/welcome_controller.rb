class WelcomeController < ApplicationController
  def login_test
    raise ENV['TWITTER_SECRET_KEY'].inspect
  end
end

