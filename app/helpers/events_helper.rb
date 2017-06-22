module EventsHelper
  def attends?
    Attendee.where(user_id: current_user.id, event_id: @event.id).any?
  end

  def attendees_count
    Attendee.where(event_id: @event.id).count
  end

  def user_attends
    return 'Not yet' unless attends?
    'Yeap!'
  end
end
