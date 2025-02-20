class SongsController < ApplicationController
  def index
    @songs=Song.all
  end

  def show
    set_song
  end

  def new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    set_song
  end

  def update
    set_song
    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    set_song
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private
  def set_song
    @song = Song.find(params[:id])

  end

  def song_params
    params.require(:song).permit(:title)
  end
end

