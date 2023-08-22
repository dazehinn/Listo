require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /categories' do
    before(:example) { get('/categories') }

    it 'returns http found' do
      expect(response).to have_http_status(:found)
    end

    it 'redirects to the sign_in page' do
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'includes the correct placeholder text in the body' do
      expect(response.body).to include('redirected')
    end
  end
end
