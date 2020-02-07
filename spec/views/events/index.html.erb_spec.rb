require 'rails_helper'

RSpec.describe "events/index", type: :view do
  let(:user) { create(:user) }
  let(:event1) do
    {
      title: 'title3',
      description: 'description',
      month_day: 20,
      month_direction: 'start_of_month',
      time: Time.parse('2020-01-04 5:30:00'),
      user_id: user.id
    }
  end

  let(:event2) do
    {
      title: 'title4',
      description: 'description',
      month_day: 20,
      month_direction: 'start_of_month',
      time: Time.parse('2020-01-04 5:30:00'),
      user_id: user.id
    }
  end

  before(:each) do
    assign(:events, [event1, event2].collect { |r| Event.create!(r) })
  end

  it 'renders a list of events' do
    render
    assert_select 'tr>td', text: 'title3'.to_s, count: 1
    assert_select 'tr>td', text: 'title4'.to_s, count: 1
    assert_select 'tr>td', text: 'description'.to_s, count: 2
    assert_select 'tr>td', text: '20th of month'.to_s, count: 2
    assert_select 'tr>td', text: '00:00 AM'.to_s, count: 2
  end
end
