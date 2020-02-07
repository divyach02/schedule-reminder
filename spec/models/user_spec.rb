require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    context 'valid factories present' do
      it { build(:user).should be_valid }
    end

    context 'email' do
      context 'should be valid' do
        let(:valid) { build(:user, email: 'email@example.com') }
        it { expect(valid).to be_valid }
      end

      context 'should be invalid' do
        let(:invalid) { build(:user, email: nil) }
        it { expect(invalid).not_to be_valid }
      end
    end
  end
end
