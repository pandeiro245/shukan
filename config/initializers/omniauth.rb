Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET_KEY'], {
    secure_image_url: 'true',
    image_size: 'bigger'
  }
end
OmniAuth.config.logger = Rails.logger
