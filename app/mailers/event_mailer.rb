class EventMailer < ApplicationMailer

  def send_reminder_mail(user_id, reminder_id)
    @user = User.find_by(id: user_id)
    @event = Event.find_by(id: reminder_id)
    mail(to: @user.email, subject: 'Reminder Schedule', content_type: 'multipart/alternative', boundary: 'boundary-string')
  end
end
