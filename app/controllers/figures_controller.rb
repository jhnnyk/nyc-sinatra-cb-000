class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all

    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])

    if params[:title][:name].empty?
      @figure.title_ids = params[:figure][:title_ids]
    else
      @figure.titles << Title.find_or_create_by_name(params[:title][:name])
    end

    if params[:landmark][:name].empty?
      @figure.landmark_ids = params[:figure][:landmark_ids]
    else
      @figure.landmarks << Landmark.find_or_create_by_name(params[:landmark][:name])
    end

    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]

    if params[:title][:name].empty?
      @figure.title_ids = params[:figure][:title_ids]
    else
      @figure.titles << Title.find_or_create_by_name(params[:title][:name])
    end

    if params[:landmark][:name].empty?
      @figure.landmark_ids = params[:figure][:landmark_ids]
    else
      @figure.landmarks << Landmark.find_or_create_by_name(params[:landmark][:name])
    end

    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

end
