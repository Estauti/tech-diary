require 'rails_helper'

RSpec.describe "Discoveries", type: :request do
  describe "GET /discoveries" do
    it "returns success" do
      get discoveries_path
      expect(response).to have_http_status(200)
    end

    it 'returns an array' do
      get discoveries_path
      expect(json_body).to be_an_instance_of(Array)
    end
  end

  describe 'GET /discoveries/:id' do
    let(:discovery) { create(:discovery) }

    it 'returns success' do
      get discovery_path(id: discovery.id)

      expect(response).to have_http_status(:ok)
    end

    it 'returns requested discovery' do
      get discovery_path(id: discovery.id)

      expect(json_body['id']).to eq(discovery.id)
    end

    it 'returns 404 if discovery not found' do
      get discovery_path(id: 0)

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST /discoveries' do
    let(:valid_attributes) do 
      attributes_for(:discovery).merge({ 
        user_id: create(:user).id
      })
    end
    let(:invalid_attributes) do 
      attributes_for(:discovery).merge({
        user_id: nil
      })
    end

    it 'returns success' do
      post discoveries_path, params: { discovery: valid_attributes }

      expect(response).to have_http_status(:created)
    end

    it 'increases discoveries count by 1' do
      expect {
        post discoveries_path, params: { discovery: valid_attributes }
      }.to change(Discovery, :count).by(1)
    end

    it 'returns 422 when invalid attributes' do
      post discoveries_path, params: { discovery: invalid_attributes }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE /discoveries/:id' do
    let!(:discovery) { create(:discovery) }

    it 'returns success' do
      delete discovery_path(id: discovery.id)

      expect(response).to have_http_status(:no_content)
    end

    it 'decreases discoveries count by 1' do
      expect {
        delete discovery_path(id: discovery.id)
      }.to change(Discovery, :count).by(-1)
    end

    it 'returns 404 if discovery not found' do
      delete discovery_path(id: 0)

      expect(response).to have_http_status(:not_found)
    end
  end
end
