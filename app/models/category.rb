class Category < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :icon, presence: true

  def total_amount
    items.sum(:amount)
  end
end
