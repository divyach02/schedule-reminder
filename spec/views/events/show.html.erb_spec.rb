require 'rails_helper'

RSpec.describe "events/show", type: :view do
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
      month_direction: 'end_of_month',
      time: Time.parse('2020-01-04 5:30:00'),
      user_id: user.id
    }
  end

  it 'renders attributes in <p> for event1' do
    @event = assign(:event, Event.create(event1))
    render
    expect(rendered).to match(/title3/)
    expect(rendered).to match(/description/)
    expect(rendered).to match(/20th of month/)
    expect(rendered).to match(/00:00 AM/)
  end

  it 'renders attributes in <p> for event2' do
    @event = assign(:event, Event.create(event2))
    render
    expect(rendered).to match(/title4/)
    expect(rendered).to match(/description/)
    expect(rendered).to match(/00:00 AM/)
  end
end
