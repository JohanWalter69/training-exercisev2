class Review < ApplicationRecord
  belongs_to :user
  belongs_to :adoption

  validates :rating, :description, presence: true
  validates :rating, numericality: { only_integer: true, in: (0..5) }
  validates :description, length: { in: 3..114 }

end
