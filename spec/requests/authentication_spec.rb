require 'rails_helper'

RSpec.describe 'Login', type: :request do
  let(:url) { '/login' }

  describe 'when params are correct' do
    let(:user) { create(:user) }
    let(:user_params) do 
      {
        email: user.email,
        password: user.password
      }
    end

    before do 
      post url, params: { user: user_params }
    end

    it 'returns success' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns jwt token in authorization header' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns valid jwt token' do
      token_from_request = response.headers['Authorization'].split(' ').last
      decoded_token = JWT.decode(token_from_request, ENV['DEVISE_JWT_SECRET_KEY'], true)

      expect(decoded_token.first['sub']).to be_present
    end
  end

  describe 'when params are incorrect' do
    let(:user) { create(:user, password: '12345678') }

    it 'returns unauthorized status' do
      post url

      expect(response).to have_http_status(:unauthorized)
    end

    it "returns unauthorized for wrong password" do
      post url, params: { user: {
        email: user.name,
        password: '00000000'
      } }

      expect(response).to have_http_status(:unauthorized)
    end
  end
end

RSpec.describe 'Logout' do
  pending 'logout with jwt token returns success'
end