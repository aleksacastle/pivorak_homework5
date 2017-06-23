require 'rails_helper'

describe Event, type: :model do
  let(:admin_user) { create :user }
  let(:event) { create :event, user_id: admin_user.id }

  before { create :admin, user_id: admin_user.id }

  describe 'valid event' do
    let(:event) { create :event, user_id: admin_user.id }

    specify do
      expect(event).to be_valid
    end
  end

  describe 'valid event' do
    let(:event) { build :event, user_id: admin_user.id, address: nil, date_time: nil, title: nil }

    specify do
      expect(event).not_to be_valid

      expect(event.errors.messages.count).to eq 3 # three validations failed
    end
  end
end