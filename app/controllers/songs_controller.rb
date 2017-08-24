class SongsController < ActionController::Base

    layout "application"

    before_action :set_song, only: [:show, :edit, :update, :destroy]

    def index
    end

    def show
    end

    def edit
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params)

        respond_to do |format|
            if @song.save
                format.html { redirect_to @song, notice: 'song created.' }
                format.json { render :show, status: :created, location: @song }
            else
                format.html { render :new }
                format.json { render json: @song.errors, status: :unprocessable_entity }
            end
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
        @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
        params.require(:song).permit(:name, :artist, :album)
    end
end
