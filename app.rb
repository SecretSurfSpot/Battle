require 'sinatra'
require 'shotgun'

class Battle < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, "My session secret"
  end

  get '/' do
    erb :index
  end

  post '/names' do
    session[:p1], session[:p2] = params[:p1_name], params[:p2_name]
    redirect '/play'
  end

  get '/play' do
    @p1, @p2 = session[:p1], session[:p2]
    erb :play
  end

  get '/attack' do
    @p1, @p2 = session[:p1], session[:p2]
    erb :attack
  end

  # Required if running from command line (ruby app.rb) and not using 'rackup'
  run! if app_file == $0

end
