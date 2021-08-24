class TracksController < ApplicationController
    before_action :set_track, only: [:show, :update, :destroy]

  # GET /tracks
  def index
    # get current user tracks
    @tracks = current_user.tracks
    json_response(@tracks)
  end

  # POST /tracks
  def create
    # create tracks belonging to current user
    @track = current_user.tracks.create!(track_params)
    json_response(@track, :created)
  end

  # GET /tracks/:id
  def show
    json_response(@track)
  end

  # PUT /tracks/:id
  def update
    @track.update(track_params)
    head :no_content
  end

  # DELETE /tracks/:id
  def destroy
    @track.destroy
    head :no_content
  end

  private

  def track_params
    params.permit(:title)
  end

  def set_track
    @track = Track.find(params[:id])
  end
end
