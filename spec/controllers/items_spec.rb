require 'rails_helper'

RSpec.describe 'Items', type: :request do
  before(:example) do
    @user = User.create(name: 'Firefly', email: 'firefly@example.com', password: '123456')
    @category = Category.create(icon: 'icon.png', name: 'Category', user_id: @user.id)
    @item = Item.create(name: 'Transaction', amount: 100, category_id: @category.id, user_id: @user.id)
  end

  describe 'GET /items' do
    before(:example) { get('/categories/1/items') }

    it 'Returns http found' do
      expect(response).to have_http_status(:found)
    end

    it 'The user is redirected to sign_in' do
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'Includes the correct placeholder text' do
      expect(response.body).to include 'redirected'
    end
  end
end
