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
      @protocol = Protocol.create(name: params[:name], description: params[:description])
      redirect to ("/protocols/#{@protocol.id}")
    else
      protocol ? @params = {} : @params = params      
      erb :"/protocols/new.html"
    end
  end

  # GET: /protocols/5
  get "/protocols/:id" do
    if Helpers.is_logged_in?(session)
      erb :"/protocols/show.html"
    else
      redirect to ('/')
    end
  end

  # GET: /protocols/5/edit
  get "/protocols/:id/edit" do
    erb :"/protocols/edit.html"
  end

  # PATCH: /protocols/5
  patch "/protocols/:id" do
    redirect "/protocols/:id"
  end

  # DELETE: /protocols/5/delete
  delete "/protocols/:id/delete" do
    if Helpers.is_logged_in?(session)
      redirect "/protocols"
    else
      redirect to ('/')
    end
  end
end
