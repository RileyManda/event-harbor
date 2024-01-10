class Event < ApplicationRecord
  belongs_to :category
  has_many :participants
  attribute :event_type, default: 'Private'
  attribute :reservations, default: false
  validates :tickets_left, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, length: { maximum: 150 }
end
