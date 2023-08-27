require 'rails_helper'

RSpec.describe 'items/index', type: :view do
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
    assign(:category, @category)
    assign(:items, [@item])
    assign(:total_amount, @item.amount)
  end

  it 'renders the header' do
    render
    expect(rendered).to have_content('Transactions')
    expect(rendered).to have_content(@category.name)
  end

  it 'renders the transactions' do
    render
    expect(rendered).to have_content('Transactions for:')
    expect(rendered).to have_content(@item.name)
    expect(rendered).to have_content(@item.amount)
  end

  it 'renders the "No registered transactions" message when no items' do
    assign(:items, [])
    render
    expect(rendered).to have_content('No registered transactions')
    expect(rendered).to have_content('Your new transactions will be placed here')
  end

  it 'renders the "Add a new transaction" link' do
    render
    expect(rendered).to have_link('Add a new transaction', href: new_category_item_path(category_id: @category.id))
  end
end
