Airbrake.configure do |c|
  c.project_id = ENV['AIRBRAKE_ID']
  c.project_key = ENV['AIRBRAKE_KEY']
end
