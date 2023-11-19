class Event < ApplicationRecord
  belongs_to :category
  has_many :participants
  attribute :visibility, default: false

  validates :tickets_left, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
