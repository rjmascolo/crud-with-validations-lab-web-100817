class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song.new(post_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(post_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
  
end
