class Tree < ApplicationRecord
  belongs_to :user
  has_many :adoptions, dependent: :destroy

  validates :name, :address, :fruits, :description, :quantity_by_year, presence: true
  validates :fruits, inclusion: { in: %w(Apple Apricot Cherry Chestnut 'Coconut Tree' Fig
    Grapefruit Hazel Mandarin Mango Mirabellier Mulberry Olivier Orange Pear Plum)}
  validates :description, length: { in: 20..280 }
  validates :quantity_by_year, :price_per_year, numericality: { greater_than_or_equal_to: 0}
end
