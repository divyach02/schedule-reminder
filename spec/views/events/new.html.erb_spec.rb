require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, build(:event))
  end

  it 'renders new event form' do
    render

    assert_select 'form[action=?][method=?]', events_path, 'post' do
      assert_select 'input[name=?]', 'event[title]'
      assert_select 'textarea[name=?]', 'event[description]'
      assert_select 'select[name=?]', 'event[month_day]'
      assert_select 'input[name=?]', 'event[time]'
    end
  end
end
