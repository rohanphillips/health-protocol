class UsersController < ApplicationController

  # # GET: /users
  # get "/users" do
  #   erb :"/users/index.html"
  # end

  # # GET: /users/new
  # get "/users/new" do
  #   erb :"/users/new.html"
  # end

  # # POST: /users
  # post "/users" do
  #   redirect "/users"
  # end

  # # GET: /users/5
  get "/users/:id" do
    if is_logged_in?
      @user = User.find(params[:id])
      erb :"/users/show.html"
    else
      redirect to ("/")
    end
  end

  # # GET: /users/5/edit
  get "/users/:id/edit" do
    if is_logged_in?
      @user = User.find(params[:id])
      erb :"/users/edit.html"
    else
      redirect to "/"
    end
  end

  # # PATCH: /users/5
  patch "/users/:id" do
    if is_logged_in?
      @user = User.find(params[:id])
      if params[:user][:password] != ""
        @user.update(params[:user])
      else
        @user.update(username: params[:user][:username], email: params[:user][:email])
      end
      redirect "/users/#{@user.id}"
    else
      redirect to ("/")
    end
  end

  # # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    user = User.find(params[:id])
    user.records.delete_all
    User.delete(user.id)
    session.clear
    binding.pry
    redirect "/"
  end
  
end
