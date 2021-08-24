class TracksController < ApplicationController
    before_action :set_track, only: [:show, :update, :destroy]

  def index
    @tracks = current_user.tracks
    json_response(@tracks)
  end

  def create
    @track = current_user.tracks.create!(track_params)
    json_response(@track, :created)
  end

  def show
    json_response(@track)
  end

  def update
    @track.update(track_params)
    head :no_content
  end
  
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
