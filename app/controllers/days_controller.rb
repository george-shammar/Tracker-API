class DaysController < ApplicationController
    before_action :set_track
    before_action :set_track_day, only: [:show, :update, :destroy]
  
    def index
      json_response(@track.days)
    end
  
    def show
      json_response(@day)
    end
  
    def create
      @track.days.create!(day_params)
      json_response(@track, :created)
    end
  
    def update
      @day.update(day_params)
      head :no_content
    end
  
    def destroy
      @day.destroy
      head :no_content
    end
  
    private
  
    def day_params
      params.permit(:blood_pressure, :blood_sugar)
    end
  
    def set_track
      @track = Track.find(params[:track_id])
    end
  
    def set_track_day
      @day = @track.days.find_by!(id: params[:id]) if @track
    end
end
