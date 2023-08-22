require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:example) do
    @user = User.create(name: 'Firefly', email: 'firefly@example.com', password: '123456')
  end

  describe 'GET /users' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end
end
