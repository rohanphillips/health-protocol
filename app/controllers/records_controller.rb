class RecordsController < ApplicationController

  # GET: /records
  get "/records" do
    erb :"/records/index.html"
  end

  # GET: /records/new
  get "/records/new" do
    erb :"/records/new.html"
  end

  # POST: /records
  post "/records" do
    redirect "/records"
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
