class ProtocolRecordsController < ApplicationController

  # GET: /protocol_records
  get "/protocol_records" do
    erb :"/protocol_records/index.html"
  end

  # GET: /protocol_records/new
  get "/protocol_records/new" do
    erb :"/protocol_records/new.html"
  end

  # POST: /protocol_records
  post "/protocol_records" do
    redirect "/protocol_records"
  end

  # GET: /protocol_records/5
  get "/protocol_records/:id" do
    erb :"/protocol_records/show.html"
  end

  # GET: /protocol_records/5/edit
  get "/protocol_records/:id/edit" do
    erb :"/protocol_records/edit.html"
  end

  # PATCH: /protocol_records/5
  patch "/protocol_records/:id" do
    redirect "/protocol_records/:id"
  end

  # DELETE: /protocol_records/5/delete
  delete "/protocol_records/:id/delete" do
    redirect "/protocol_records"
  end
end
