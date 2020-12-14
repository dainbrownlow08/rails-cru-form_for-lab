class SongsController < ApplicationController
    def index
        @songs = Song.all
    end
    
    def show
        @song = Song.find(params[:id])
        @artist = Artist.find(@song.artist_id)
        @genre = Genre.find(@song.genre_id)
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(params.require(:song).permit(:name, :artist_id, :genre_id))
        @song.name = params[:song][:name]
        @song.artist_id = params[:song][:artist_id]
        @song.genre_id = params[:song][:genre_id]
        @song.save
        redirect_to song_path(@song)
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        @song.update(params.require(:song).permit(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)
    end

end



#expected for show page links?
#<div>
# <% @songs.each do |song| %>
#     <% @artist = Artist.find(song.artist_id)%>
#     <% @genre = Genre.find(song.genre_id)%>
#     <div><%= song.name %></div>
#     <div><%= link_to @artist.name, artist_path(@artist) %></div>
#     <div><%= link_to @genre.name, genre_path(@genre) %></div>
#   <% end %>
# </div>