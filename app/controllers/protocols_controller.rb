class ProtocolsController < ApplicationController

  # GET: /protocols
  get "/protocols" do
    erb :"/protocols/index.html"
  end

  # GET: /protocols/new
  get "/protocols/new" do
    erb :"/protocols/new.html"
  end

  # POST: /protocols
  post "/protocols" do
    redirect "/protocols"
  end

  # GET: /protocols/5
  get "/protocols/:id" do
    erb :"/protocols/show.html"
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
    redirect "/protocols"
  end
end
