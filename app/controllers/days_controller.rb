class DaysController < ApplicationController
    before_action :set_track
    before_action :set_track_day, only: [:show, :update, :destroy]
  
    # GET /tracks/:track_id/days
    def index
      json_response(@track.days)
    end
  
    # GET /tracks/:track_id/days/:id
    def show
      json_response(@day)
    end
  
    # POST /tracks/:track_id/days
    def create
      @track.days.create!(day_params)
      json_response(@track, :created)
    end
  
    # PUT /tracks/:track_id/days/:id
    def update
      @day.update(day_params)
      head :no_content
    end
  
    # DELETE /track/:track_id/days/:id
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
