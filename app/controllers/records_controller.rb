class RecordsController < ApplicationController

  # GET: /records
  get "/records" do
    erb :"/records/index.html"
  end

  # GET: /records/new
  get "/records/new" do
    if Helpers.is_logged_in?(session)
      @protocols = Protocol.all
      erb :"/records/new.html"
    else
      redirect to('/')
    end  
  end

  # POST: /records
  post "/records" do
    if Helpers.is_logged_in?(session)
      @protocol = Protocol.find_by(name: params[:name])
      if !!@protocol
        if Helpers.is_protocol_complete?(params)
          @protocolrecord = ProtocolRecord.create(user_id: Helpers.current_user(session).id, protocol_id: @protocol.id, record_id: Record.create(params[:data]).id)          
          binding.pry
        else
          @protocols = Protocol.all
          @params = params
          erb :"/records/new.html"
        end;
      else
        @protocols = Protocol.all
        @params = params
        erb :"/records/new.html"
      end
    else
      redirect "/"
    end
  end

  # GET: /records/5
  get "/records/:id" do
    erb :"/records/show.html"
  end

  # GET: /records/5/edit
  get "/records/:id/edit" do
    erb :"/records/edit.html"
  end

  # PATCH: /records/5
  patch "/records/:id" do
    redirect "/records/:id"
  end

  # DELETE: /records/5/delete
  delete "/records/:id/delete" do
    redirect "/records"
  end
end
