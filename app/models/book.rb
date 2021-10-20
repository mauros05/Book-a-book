class Book < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, :edition, :author, presence: true
end
