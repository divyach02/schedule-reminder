require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'validations' do
    context 'valid factories present' do
      it { build(:event).should be_valid }
    end

    context 'title' do
      context 'should be valid' do
        let(:valid) { build(:event, title: 'title') }
        it { expect(valid).to be_valid }
      end

      context 'should be invalid' do
        let(:invalid) { build(:event, title: nil) }
        it { expect(invalid).not_to be_valid }
      end
    end

    context 'description' do
      context 'should be valid' do
        let(:valid) { build(:event, description: 'description') }
        it { expect(valid).to be_valid }
      end

      context 'should be invalid' do
        let(:invalid) { build(:event, description: nil) }
        it { expect(invalid).not_to be_valid }
      end
    end

    context 'month_day' do
      context 'should be valid' do
        let(:valid) { build(:event, month_day: 1) }
        it { expect(valid).to be_valid }
      end

      context 'should be invalid' do
        let(:invalid) { build(:event, month_day: nil) }
        it { expect(invalid).not_to be_valid }
      end
    end

    context 'month_direction' do
      context 'should be valid' do
        let(:valid) { build(:event, month_direction: 1) }
        it { expect(valid).to be_valid }
      end

      context 'should be invalid' do
        let(:invalid) { build(:event, month_direction: nil) }
        it { expect(invalid).not_to be_valid }
      end
    end

    context 'time' do
      context 'should be valid' do
        let(:valid) { build(:event, time: Time.now) }
        it { expect(valid).to be_valid }
      end

      context 'should be invalid' do
        let(:invalid) { build(:event, time: nil) }
        it { expect(invalid).not_to be_valid }
      end
    end
  end

  context 'should be month_schedule_day return valid value' do
    let(:event1) { build(:event, month_day: 1, month_direction: 'start_of_month') }
    let(:event2) { build(:event, month_day: 1, month_direction: 'end_of_month') }

    it { expect(event1.month_schedule_day).to eq 1 }
    it { expect([28, 29 , 30 , 31]).to include(event2.month_schedule_day) }
    it { expect(event2.month_schedule_day).to eq Time.days_in_month(Date.today.month) - 1 }
  end
end
