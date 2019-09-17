require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "your_health_matters"
  end

  get "/" do
    erb :index
  end

  get '/signup' do 
    if !is_logged_in?
      erb :'/login/create_user'
    else
      redirect to ('/')
    end
  end 

  post '/signup' do
    user = User.find_by username: params[:username]
    if user == nil && params[:username] != "" && params[:email] != "" && params[:password] != ""
      user = User.create(username: params[:username], email: params[:email], password: params[:password])    
      session[:user_id] = user.id
      redirect to ('/')
    else
      redirect to ('/signup')
    end
    
  end  

  get '/login' do
    if !is_logged_in?
      erb :'/login/login'
    else
      redirect to ("/")
    end
  end

  post '/login' do    
    user = User.find_by username: params[:username]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to ('/')
    else
      if user
        @username = user.username
      end
      erb :'/login/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  helpers do
    def current_user
      User.find(session[:user_id])
    end

    def is_logged_in?
      !!session[:user_id]
    end

    def is_home_page?
      @env["sinatra.route"] == "GET /"
    end

    def redirect_if_not_logged_in
      if !is_logged_in?
        redirect to ("/")
      end
    end

    def valid_inputs?(params)      
      is_valid = true
      params.each do |hash|
        new_hash = hash[1] 
        if new_hash.is_a?(::Hash)
          new_hash.each do |data_hash|
            if data_hash[1] == ""
              is_valid = false              
              break
            end
          end
        end
      end
      is_valid
    end

  end

end
