require 'rails_helper'

RSpec.describe 'categories/index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Firefly', email: 'firefly@example.com', password: '123456')
    @category = Category.create(icon: 'https://example.com/icon.png', name: 'Category', user_id: @user.id)
    @item = Item.create(
      name: 'Testing',
      amount: 100,
      category_id: @category.id,
      user_id: @user.id,
      author: @user,
      created_at: Time.now,
      updated_at: Time.now
    )
    visit new_user_session_path
    fill_in 'Email', with: 'firefly@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end

  it 'Logged user can visit the categories index page' do
    visit categories_path

    expect(page).to have_content('Aggregate Spending')
    expect(page).to have_content("$#{@item.amount}")
  end

  it 'Logged user can visit the new category page' do
    visit new_category_path

    expect(page).to have_content('New Category')
    expect(page).to have_css('form')
    expect(page).to have_css('input[type=submit]')
  end
end
