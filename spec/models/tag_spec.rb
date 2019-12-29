require 'rails_helper'

RSpec.describe Tag, type: :model do
  context 'valid cases' do
    it 'is valid on creation' do
      tag = build(:tag)

      expect(tag).to be_valid
    end
  end

  context 'invalid cases' do
    it 'throws error when repeating name' do
      tag_name = FFaker::Lorem.word
      create(:tag, name: tag_name)

      expect {
        create(:tag, name: tag_name)
      }.to raise_error(ActiveRecord::RecordNotUnique)
    end

    it 'is invalid with empty name' do
      tag = build(:tag, name: '')

      expect(tag).to be_invalid
    end

    it 'throws error with null name' do
      expect {
        create(:tag, name: nil)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
