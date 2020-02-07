class Event < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :description, :month_day, :month_direction, :time

  enum month_direction: %i[start_of_month end_of_month]

  def scheduled?(event_time)
    event_time >= (scheduled_datetime - 30.minutes) && event_time <= scheduled_datetime
  end

  def month_schedule_day
    start_of_month? ? month_day : Time.days_in_month(Date.today.month) - month_day
  end

  private

  def scheduled_datetime
    Time.new( schedule_date.year,
              schedule_date.month,
              schedule_date.day,
              time.hour, time.min)
  end

  def schedule_date
    diff_days = (month_day - 1).days
    start_date_of_month + (start_of_month? ? diff_days : (-1 * diff_days))
  end

  def start_date_of_month
    Date.today.beginning_of_month
  end

  def end_date_of_month
    Date.today.end_of_month
  end
end
