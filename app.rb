require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/content_for"
require "tilt/erubi"
require "securerandom"

configure do
  enable :sessions
  set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(32) }
  set :erb, :escape_html => true
  set :views, File.join(settings.public_folder, 'views')
end

helpers do

end

before do

end

get "/" do
  erb :home, layout: :layout
end