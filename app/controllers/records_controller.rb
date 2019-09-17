class RecordsController < ApplicationController

  # GET: /records
  get "/records" do
    if is_logged_in?
      @userrecords = ProtocolRecord.where(user_id: current_user.id)
      erb :"/records/index.html"
    else
      redirect to('/')
    end
  end

  # GET: /records/new
  get "/records/new" do
    if is_logged_in?
      @protocols = Protocol.all
      @params = {}
      erb :"/records/new.html"
    else
      redirect to('/')
    end  
  end

  # POST: /records
  post "/records" do
    if is_logged_in?
      @protocol = Protocol.find_by(name: params[:protocol_data][:name])
      if !!@protocol
        if valid_inputs?(params)
          @protocolrecord = ProtocolRecord.create(user_id: current_user.id, protocol_id: @protocol.id, record_id: Record.create(params[:record_data]).id)          
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
    if is_logged_in?
      @pr = ProtocolRecord.find_by(record_id: params[:id])
      if @pr.user.id == current_user.id then
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
    if is_logged_in?
      @pr = ProtocolRecord.find_by(record_id: params[:id])
      if current_user.id == @pr.user.id
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
    if is_logged_in?
      @pr = ProtocolRecord.find_by(record_id: params[:id])
      if current_user.id == @pr.user.id
        if valid_inputs?(params)
          @pr.record.update(params[:record_data])
          redirect "/records/#{params[:id]}"
        else
          redirect to ("/records/#{params[:id]}/edit")
        end
      else
        redirect to ("/records")
      end
    else
      redirect "/"
    end
  end

  # DELETE: /records/5/delete
  delete "/records/:id/delete" do
    if is_logged_in?
      @pr = ProtocolRecord.find_by(record_id: params[:id])
      if current_user.id == @pr.user.id
        @pr.record.delete
        @pr.delete
        redirect "/records"
      else
        redirect to ("/records")
      end
    else
      redirect to ("/")
    end
  end

  helpers do
    def record_data(hash, data_hash_name, data_name)
      data = ""
      if hash.has_key? "#{data_hash_name}"
        if hash["#{data_hash_name}"].has_key? "#{data_name}"
          data = hash["#{data_hash_name}"]["#{data_name}"]
        end
      end
      data
    end
  end

end
