require 'rails_helper'

describe EventsController, type: :controller do
  let(:admin_user) { create :user }
  let(:event) { create :event, user_id: admin_user.id }

  before { create :admin, user_id: admin_user.id }

  describe 'GET index' do
    describe 'unuthorized user' do
      specify do
        get :index

        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end

  describe 'authorized user' do
    before do
      authorize_user
    end

    specify do
      get :index

      expect(response).to render_template(:index)
    end
  end

  def authorize_user(user = :user)
    @request.env['devise.mapping'] = Devise.mappings[user]
    sign_in FactoryGirl.create(user, email: 'new_tes@mail.com')
  end
end