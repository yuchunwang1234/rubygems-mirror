require 'sinatra'
require 'tilt/erb'
require 'sinatra/reloader' if development?

set :views, File.join(File.dirname(__FILE__), 'views')

get '/' do
  erb(:index)
end

get('/assets/*') do |path|
  resource = File.join(File.dirname(__FILE__), 'assets', path)

  # If not found again, return a 404
  return not_found unless File.exist?(resource)

  send_file(resource)
end
