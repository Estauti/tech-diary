require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    before do
      get users_path
    end
    
    it "returns success" do
      expect(response).to have_http_status(:ok)
    end

    it 'returns an array' do
      expect(json_body).to be_an_instance_of(Array)
    end
  end

  describe 'GET /users/:id' do
    let(:user) { create(:user) }

    describe 'when user exists' do
      before do
        get user_path(id: user.id)
      end
  
      it 'returns success' do
        expect(response).to have_http_status(:ok)  
      end

      it 'returns requested user' do
        expect(json_body['id']).to eq(user.id)
      end
    end

    describe 'when user not found' do
      it 'returns 404 status' do
        get user_path(id: 0)

        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
