class Adoption < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :starts_at, :ends_at, presence: true
end
