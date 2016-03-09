require 'gemirro'
Gemirro::CLI.load_configuration('./config/gemirro.rb')
require 'gemirro/server'

module RubyChina
  class Server < ::Gemirro::Server
    set :root, File.dirname(__FILE__)
    set :views, File.join(root, 'views')
    if settings.development?
      set :reload_templates, true
    end

    get '/' do
      erb(:index)
    end

    get('/assets/*') do |path|
      resource = File.join(File.dirname(__FILE__), 'assets', path)

      # If not found again, return a 404
      return not_found unless File.exist?(resource)

      send_file(resource)
    end
  end
end
