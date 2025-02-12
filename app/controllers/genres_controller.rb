class GenresController < ApplicationController
  def index
    @genres = Genre.all
	end

	def show
    @genre = Genre.find_by(id: params[:id])
	end

	def new
    @genre = Genre.new
	end

	def create
    genre = Genre.create(genre_params(:name))
    redirect_to "/genres/#{genre.id}"
	end

	def edit
    @genre = Genre.find_by(id: params[:id])
	end

	def update
    genre = Genre.find_by(id: params[:id])
    genre.update(genre_params(:name))
    redirect_to "/genres/#{genre.id}"
	end
end

private

def genre_params(*args)
  params.require(:genre).permit(*args)
end
