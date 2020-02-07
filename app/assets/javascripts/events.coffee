ready = ->
  input = $('.clockpicker').clockpicker
    donetext: 'Done'

  $('#clock-icon').click (e) ->
    e.stopPropagation()
    input.clockpicker('show').clockpicker 'toggleView', 'minutes'

  $("#event_month_day, input[name='event[month_direction]']").change (e) ->
    update_month_text()

$(document).on('turbolinks:load',ready)

nth = (n) ->
  [
    'st'
    'nd'
    'rd'
  ][((n + 90) % 100 - 10) % 10 - 1] or 'th'

update_month_text = () ->
  day = parseInt($("#event_month_day").val());
  direction = $("input[name='event[month_direction]']:checked").val().replace(/_/g, ' ');
  month_text = nth(day)+ ' ' + direction;
  $('.month-day').text(month_text)
