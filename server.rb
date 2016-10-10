require 'sinatra'
require 'tilt/erb'
require 'sinatra/reloader' if development?
require 'json'
require 'faraday'

set :views, File.join(File.dirname(__FILE__), 'views')

get '/' do
  erb(:index)
end

get '/add_spec' do
  erb(:add_spec)
end

post '/add_spec' do
  params[:prerelease] ||= false
  params[:platform] ||= 'ruby'
  start = Time.now
  json = params.to_json
  conn = Faraday.new(url: 'https://gems.ruby-china.org')
  res = conn.post do |req|
    req.url '/api/v1/add_spec.json'
    req.body = json
  end
  duartion = (Time.now - start).round(2)
  if res.status == 200
    "任务执行成功，耗时 #{duartion}s <a href='/add_spec'>返回</a>"
  else
    res.body
  end
end

get('/assets/*') do |path|
  resource = File.join(File.dirname(__FILE__), 'assets', path)

  # If not found again, return a 404
  return not_found unless File.exist?(resource)

  send_file(resource)
end
