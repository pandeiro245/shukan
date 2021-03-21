class User < ApplicationRecord
  has_many :goals

  def yet?
    Event.where(goal: goals, date_on: Time.zone.now.to_date).blank?
  end

  def url
    refresh_token! if token.blank?
    "https://#{ENV['WHITE_HOST']}/login?user_id=#{id}&token=#{token}"
  end

  def refresh_token!
    self.token = SecureRandom.hex(64)
    self.save!
  end
end
