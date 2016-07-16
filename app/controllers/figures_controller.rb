require 'pry'

class FiguresController < ApplicationController

    get '/figures' do
      @figures = Figure.all
      erb :'figures/index'
    end

    get '/figures/new' do
      erb :'figures/new'
    end

    get '/figures/:id' do
      @figure = Figure.find(params[:id])
      erb :'figures/show'
    end

    get '/figures/:id/edit' do 
      @figure = Figure.find(params[:id])
      erb :'figures/edit'
    end

    post '/figures' do
      @figure = Figure.create(params["figure"])
      if !params[:landmark][:name].empty?
        @figure.landmarks << Landmark.create(params[:landmark])
      end
      if !params[:title][:name].empty?
        @figure.titles << Title.create(params[:title])
      end
      @figure.save
      redirect to "/figures/#{@figure.id}"
    end 

    post '/figures/:id' do

      @figure = Figure.find_by(params["id"]) 

      # @figure = Figure.find_by(params[:id])
      # @figure.update(params[:figure])

      @figure.update(name: params["figure"]["name"])

      # @figure.landmark_ids = params["figure"]["landmark_ids"]
      # @figure.title_ids = params["figure"]["title_ids"]
      
      @figure.save

      if !params[:landmark][:name].empty?
        @figure.landmarks << Landmark.create(params[:landmark])
      end

      if !params[:title][:name].empty?
        @figure.titles << Title.create(params[:title])
      end

      redirect to "/figures/#{@figure.id}"

      # WHEN TO USE USE VS POST EDIT?
    end 
      
end