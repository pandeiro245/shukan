class User < ApplicationRecord
  has_many :goals
  belongs_to :goal, optional: true

  def yet?
    Event.where(goal: goal, date_on: Util.now.to_date).blank?
  end

  def no_goal?
    return true if goal_id.blank?
    return true if goal_updated_at < Util.now.beginning_of_week
    false
  end

  def status
    return 'no goal' if no_goal?
    return 'yet' if yet?
    'done'
  end

  def url
    refresh_token! if token.blank?
    "https://#{ENV['WHITE_HOST']}/login?user_id=#{id}&token=#{token}"
  end

  def refresh_token!
    self.token = SecureRandom.hex(64)
    self.save!
  end

  def self.find_or_create_from_auth(auth)
    uid = auth[:uid]
    name = auth[:info][:name]
    image_url = auth[:info][:image]
    uri = URI.parse(image_url)

    user = self.find_or_create_by(twitter_id: uid)
    user.name = name
    user.image_url = uri
    user.save!

    user
  end
end
