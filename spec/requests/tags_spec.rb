require 'rails_helper'

RSpec.describe "Tags", type: :request do
  describe "GET /tags" do
    it "returns success" do
      get tags_path
      
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /tags' do
    let(:valid_attributes) { attributes_for(:tag) }
    let(:invalid_attributes) { attributes_for(:tag, name: nil)}

    it 'returns success' do
      post tags_path, params: { tag: valid_attributes }

      expect(response).to have_http_status(:created)
    end

    it 'increases tags count by 1' do
      expect {
        post tags_path, params: { tag: valid_attributes }
      }.to change(Tag, :count).by(1)
    end

    it 'returns 422 when invalid attributes' do
      post tags_path, params: { tag: invalid_attributes }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE /tags' do
    let!(:tag) { create(:tag) }

    it 'returns success' do
      delete tag_path(id: tag.id)

      expect(response).to have_http_status(:no_content)
    end

    it 'decreases tags count by 1' do
      expect {
        delete tag_path(id: tag.id)
      }.to change(Tag, :count).by(-1)
    end

    it 'returns 404 if tag not found' do
      delete tag_path(id: 0)

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET /tags/:id' do
    let(:tag) { create(:tag) }

    it 'returns success' do
      get tag_path(id: tag.id)

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if tag not found' do
      get tag_path(id: 0)

      expect(response).to have_http_status(:not_found)
    end
  end
end
