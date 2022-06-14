class ActivitiesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

    def index
        activities = Activity.all
        render json: activities, status: :ok
    end

    def destroy
        activity = Activity.find(params[:id])
        activity.destroy!

    end

    private
    def not_found_response
        render json: { error: "Activity not found" }, status: 404 
    end

end
