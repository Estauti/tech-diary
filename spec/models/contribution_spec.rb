require 'rails_helper'

RSpec.describe Contribution, type: :model do
  describe 'valid cases on creation' do
    it 'is valid with user and discovery' do
      contribution = build(:contribution)

      expect(contribution).to be_valid
    end
  end

  describe 'invalid cases on creation' do
    it 'is invalid without an user' do
      contribution = build(:contribution, user: nil)

      expect(contribution).to be_invalid
    end

    it 'is invalid without a discovery' do
      contribution = build(:contribution, discovery: nil)

      expect(contribution).to be_invalid
    end
  end
end
