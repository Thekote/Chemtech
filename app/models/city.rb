class City < ApplicationRecord
  has_many :clients

  validates :name, presence: true
  validates :state, presence: true, length: { is: 2 }

  scope :find_by_state, -> (state) { where(state: state) }

  scope :find_by_name, -> (name) { where(name: name) }
end
