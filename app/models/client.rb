class Client < ApplicationRecord
  belongs_to :city

  enum sex: { m: 0, f: 1}

  validates :name, presence: true
  validates :sex, presence: true, length: { is: 1 }, inclusion: { in: %w[m f] }
  validates :age, presence: true, numericality: { greater_than: 0}
  validates :city, associated: true

  scope :find_by_name, -> (name) { where(name: name) }
end
