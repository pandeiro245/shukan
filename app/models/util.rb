class Util
  def self.now
    Time.zone.now.in_time_zone('Tokyo')
  end
end
