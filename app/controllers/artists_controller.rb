require "pry"
class ArtistsController < ApplicationController
	def index
    @artists = Artist.all
	end

	def show
    @artist = Artist.find_by(id: params[:id])
	end

	def new
    @artist = Artist.new
	end

	def create
    artist = Artist.create(artist_params(:name, :bio))
    redirect_to "/artists/#{artist.id}"
	end

	def edit
    @artist = Artist.find_by(id: params[:id])
	end

	def update
    artist = Artist.find_by(id: params[:id])
    artist.update(artist_params(:name, :bio))
    redirect_to "/artists/#{artist.id}"
	end
end

private

def artist_params(*args)
  params.require(:artist).permit(*args)
end
