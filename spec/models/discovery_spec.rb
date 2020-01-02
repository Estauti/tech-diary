require 'rails_helper'

RSpec.describe Discovery, type: :model do
  describe 'validations on creation' do
    context 'valid cases' do
      let(:discovery) { build(:discovery) }

      it 'is valid with text and author' do
        expect(discovery).to be_valid
      end

      it 'is valid when text has maximum number of characters' do
        valid_text = 'a' * Discovery::MAX_CHARACTERS
        discovery = build(:discovery, text: valid_text)

        expect(discovery).to be_valid
      end
    end

    context 'invalid cases' do
      it 'is invalid without an author' do
        discovery = build(:discovery, author: nil)

        expect(discovery).to be_invalid
      end

      it 'is invalid with unexisting author' do
        discovery = build(:discovery, user_id: 0)

        expect(discovery).to be_invalid
      end

      it 'is invalid with null text' do
        discovery = build(:discovery, text: nil)

        expect(discovery).to be_invalid
      end

      it 'is invalid with empty text' do
        discovery = build(:discovery, text: '')

        expect(discovery).to be_invalid
      end

      it 'is invalid with text longer than maximum number of characters' do
        invalid_text = 'a' * (Discovery::MAX_CHARACTERS + 1)
        discovery = build(:discovery, text: invalid_text)

        expect(discovery).to be_invalid
      end
    end
  end
end
