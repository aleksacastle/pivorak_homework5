class AttendeesController < ApplicationController
  before_action :authenticate_user!

  def create
    Attendee.create(attendee_params)

    redirect_to event_path(params[:event_id])
  end

  def destroy
    Attendee.where(attendee_params).destroy_all

    redirect_to event_path(params[:event_id])
  end

  private

  def attendee_params
    params.permit(:event_id).merge(user_id: current_user.id)
  end
end
