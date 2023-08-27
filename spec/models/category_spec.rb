require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = build(:user, email: 'firefly@example.com')
    @category = build(:category, user: @user)
  end

  describe 'Category validations' do
    it 'is valid with valid attributes' do
      expect(@category).to be_valid
    end

    it 'is not valid without a name' do
      @category.name = nil
      expect(@category).to_not be_valid, 'Expected category with nil name to be invalid, but it was valid'
    end

    it 'is not valid without an icon' do
      @category.icon = nil
      expect(@category).to_not be_valid, 'Expected category with nil icon to be invalid, but it was valid'
    end

    it 'is not valid without a user' do
      @category.user = nil
      expect(@category).to_not be_valid, 'Expected category with nil user to be invalid, but it was valid'
    end
  end
end
