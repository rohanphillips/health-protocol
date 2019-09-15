require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "your_health_matters"
  end

  get "/" do
    @is_home = true
    erb :index
  end

  get '/signup' do 
    if !!is_logged_in? == false
      erb :'/login/create_user'
    else
      erb :'/'
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
    if !!is_logged_in? == false
      @username = ""
      @login = true
      erb :'/login/login'
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

    def missing_inputs?(params)      
      is_complete = true
      params.each do |hash|
        new_hash = hash[1]
        new_hash.each do |data_hash|
          if data_hash[1] == ""
            is_complete = false              
            break
          end
        end
      end
      is_complete
    end

  end

end
