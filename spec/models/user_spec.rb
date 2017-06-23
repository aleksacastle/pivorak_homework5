require 'rails_helper'

describe User, type: :model do
  let(:admin_user) { create :user }
  let(:attende)    { create :user, email: 'testema@il.com' }

  before { create :admin, user_id: admin_user.id }

  it 'creates admin roel for user' do
    expect(admin_user.is_admin?).to be true
  end

  it 'attendee role' do
    expect(attende.is_admin?).to be false
  end
end