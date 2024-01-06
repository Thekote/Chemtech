class City < ApplicationRecord
  has_many :clients

  validates :name, presence: true
  validates :state, presence: true, length: { is: 2 }
end
