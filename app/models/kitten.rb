class Kitten < ApplicationRecord
  validates :name, :age, :softness, :cuteness, presence: true
  validates :softness, :cuteness, numericality: { only_integer: true }
  validates :name, uniqueness: true
end
