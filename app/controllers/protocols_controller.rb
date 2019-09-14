class ProtocolsController < ApplicationController

  # GET: /protocols
  get "/protocols" do
    if Helpers.is_logged_in?(session)
      erb :"/protocols/index.html"
    else
      redirect to('/')
    end
  end

  # GET: /protocols/new
  get "/protocols/new" do
    if Helpers.is_logged_in?(session)
      erb :"/protocols/new.html"
    else
      redirect to('/')
    end
  end

  # POST: /protocols
  post "/protocols" do
    protocol = Protocol.find_by(name: params[:name])
    if protocol == nil && params[:name] != "" && params[:description] != ""
      params[:user_id] = Helpers.current_user(session).id
      @protocol = Protocol.create(params)
      redirect to ("/protocols/#{@protocol.id}")
    else
      protocol ? @params = {} : @params = params      
      erb :"/protocols/new.html"
    end
  end

  # GET: /protocols/5
  get "/protocols/:id" do
    if Helpers.is_logged_in?(session)
      @protocol = Protocol.find(params[:id])
      erb :"/protocols/show.html"
    else
      redirect to ('/')
    end
  end

  # DELETE: /protocols/5/delete
  delete "/protocols/:id/delete" do
    if Helpers.is_logged_in?(session)
      if Helpers.current_user(session).id == Protocol.find(params[:id].to_i).user_id
        Protocol.delete(params[:id].to_i)  
      end 
      redirect "/protocols"
    else
      redirect to ('/')
    end
  end

  # GET: /protocols/5/edit
  get "/protocols/:id/edit" do
    if Helpers.is_logged_in?(session)
      if Helpers.current_user(session).id == Protocol.find(params[:id].to_i).user_id
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
    if Helpers.is_logged_in?(session)
      redirect "/protocols/:id"
    else
      redirect to ('/')
    end
  end

  
end
