# frozen_string_literal: true

namespace :reminder_schedule do
  desc 'Send reminder emails to users'
  task send_email: :environment do
    Event.all.each do |event|
      if event.scheduled?(Time.now)
        EventMailer.send_reminder_mail(event.user_id, event.id).deliver_now
      end
    end
  end
end
