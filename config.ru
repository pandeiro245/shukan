# This file is used by Rack-based servers to start the application.

require_relative "config/environment"
require 'rack/rewrite'

if ENV['RACK_ENV'] == 'production'
  use Rack::Rewrite do
    r301 %r{.*}, 'https://shukan.today$&', :if => Proc.new {|rack_env|
       rack_env['SERVER_NAME'] != 'mynewdomain.com'
    }
  end
end

run Rails.application
Rails.application.load_server
