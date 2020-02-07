require 'rails_helper'

RSpec.describe 'events/edit', type: :view do
  before(:each) do
    @event = assign(:event, create(:event))
  end

  it 'renders the edit event form' do
    render

    assert_select 'form[action=?][method=?]', event_path(@event), 'post' do
      assert_select 'input[name=?]', 'event[title]'
      assert_select 'textarea[name=?]', 'event[description]'
      assert_select 'select[name=?]', 'event[month_day]'
      assert_select 'input[name=?]', 'event[time]'
    end
  end
end
