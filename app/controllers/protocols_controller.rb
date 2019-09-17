class ProtocolsController < ApplicationController

  # GET: /protocols
  get "/protocols" do
    if is_logged_in?
      erb :"/protocols/index.html"
    else
      redirect to('/')
    end
  end

  # GET: /protocols/new
  get "/protocols/new" do
    redirect_if_not_logged_in
    erb :"/protocols/new.html"
  end

  # POST: /protocols
  post "/protocols" do
    protocol = Protocol.find_by(name: params[:name])
    if protocol == nil && params[:name] != "" && params[:description] != ""
      params[:user_id] = current_user.id
      @protocol = Protocol.create(params)
      redirect to ("/protocols/#{@protocol.id}")
    else
      protocol ? @params = {} : @params = params      
      erb :"/protocols/new.html"
    end
  end

  # GET: /protocols/5
  get "/protocols/:id" do
    if is_logged_in?
      @protocol = Protocol.find(params[:id])
      erb :"/protocols/show.html"
    else
      redirect to ('/')
    end
  end

  # DELETE: /protocols/5/delete
  delete "/protocols/:id/delete" do
    if is_logged_in?
      if current_user.id == Protocol.find(params[:id].to_i).user_id
        Protocol.delete(params[:id].to_i)  
      end 
      redirect "/protocols"
    else
      redirect to ('/')
    end
  end

  # GET: /protocols/5/edit
  get "/protocols/:id/edit" do
    if is_logged_in?
      if current_user.id == Protocol.find(params[:id].to_i).user_id
        @protocol = Protocol.find(params[:id])
        erb :"/protocols/edit.html"
      else
        redirect to ("/protocols/#{params[:id]}")
      end

    else
      redirect to ("/protocols/#{params[:id]}")
    end

  end

  # PATCH: /protocols/5
  patch "/protocols/:id" do
    redirect_if_not_logged_in
    @protocol = Protocol.find(params[:id])
    if valid_inputs?(params)
      @protocol.update(params[:protocol_data])
      redirect "/protocols/#{params[:id]}"
    else
      redirect to ("/protocols/#{params[:id]}/edit")
    end
  end

  
end
