class RecordsController < ApplicationController

  # GET: /records
  get "/records" do
    if Helpers.is_logged_in?(session)
      @userrecords = ProtocolRecord.where(user_id: Helpers.current_user(session).id)
      erb :"/records/index.html"
    else
      redirect to('/')
    end
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
          redirect to ("/records/#{@protocolrecord.record.id}")
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
    if Helpers.is_logged_in?(session)
      @pr = ProtocolRecord.find_by(record_id: params[:id])
      if @pr.user.id == Helpers.current_user(session).id then
        erb :"/records/show.html"
      else
        redirect to ("/records")
      end
    else
      redirect "/"
    end
  end

  # GET: /records/5/edit
  get "/records/:id/edit" do
    if Helpers.is_logged_in?(session)
      @pr = ProtocolRecord.find_by(record_id: params[:id])
      if Helpers.current_user(session).id == @pr.user.id
        erb :"/records/edit.html"
      else
        redirect "/records"
      end
    else
      redirect "/"
    end
  end

  # PATCH: /records/5
  patch "/records/:id" do
    if Helpers.is_logged_in?(session)
      @pr = ProtocolRecord.find_by(record_id: params[:id])
      if Helpers.current_user(session).id == @pr.user.id
        redirect "/records/#{params[:id]}"
      else
        redirect to ("/records")
      end
    else
      redirect "/"
    end
  end

  # DELETE: /records/5/delete
  delete "/records/:id/delete" do
    redirect "/records"
  end
end
