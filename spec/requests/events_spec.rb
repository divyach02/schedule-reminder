require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /events" do
    let(:current_user) { create(:user) }
    it 'works!' do
      sign_in(current_user)
      get events_path
      expect(response).to have_http_status(200)
    end
  end
end
