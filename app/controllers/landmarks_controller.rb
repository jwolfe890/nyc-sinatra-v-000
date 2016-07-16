class LandmarksController < ApplicationController

    get '/landmarks' do
      @landmark = Landmark.all
      erb :'landmarks/index'
    end

    get '/landmarks/new' do
      erb :'landmarks/new'
    end

    get '/landmarks/:id' do
      @landmark = Landmark.find(params[:id])
      erb :'landmarks/show'
    end

    get '/landmarks/:id/edit' do 
      @landmark = Landmark.find(params[:id])
      erb :'landmarks/edit'
    end

    post '/landmarks' do
      @landmark = Landmark.create(params["landmark"])
      @landmark.save
      redirect to "/landmarks/#{@landmark.id}"
    end 

    post '/landmarks/:id' do
      @landmark = Landmark.find_by(params["id"]) 

      @landmark.update(params["landmark"])

      @landmark.save

      redirect to "/landmarks/#{@landmark.id}"
      # WHEN TO USE USE VS POST EDIT?
    end 
      
end

