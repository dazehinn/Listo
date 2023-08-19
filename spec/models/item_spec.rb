require 'rails_helper'

RSpec.describe Item, type: :model do
  before(:each) do
    @user = User.create(name: 'Firefly', email: 'firefly@example.com', password: '123456')
    @category = Category.create(icon: 'icon.png', name: 'Category', user_id: @user.id)
    @item = Item.create(
      name: 'Testing',
      amount: 100,
      category_id: @category.id,
      user_id: @user.id,
      author: @user,
      created_at: Time.now,
      updated_at: Time.now
    )
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(@item).to be_valid
    end

    it 'is not valid without a name' do
      @item.name = nil
      expect(@item).not_to be_valid
    end

    it 'is not valid without an amount' do
      @item.amount = nil
      expect(@item).not_to be_valid
    end

    it 'is not valid without a user' do
      @item.user_id = nil
      expect(@item).not_to be_valid
    end

    it 'is not valid if amount is zero' do
      @item.amount = 0
      expect(@item).not_to be_valid
    end
  end
end
