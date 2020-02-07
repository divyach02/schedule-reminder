module EventsHelper
  def days_for_select
    Array(1..20)
  end

  def day_of_month(day)
    day.ordinalize + ' of month'
  end

  def month_day_text(direction, day)
    day.ordinalize.tr("0-9", "")+ ' ' +direction.gsub("_", " ")
  end
end
