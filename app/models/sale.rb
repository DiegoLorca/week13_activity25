class Sale < ApplicationRecord
  validates :cod, uniqueness: true
  validates :detail, presence: true
  validates :category, inclusion: { in: %w(uno dos tres cuatro cinco) }
  validates :value, numericality: { only_integer: true, greater_than: 0, message: "Valor debe ser entero y positivo." }
  validates :discount, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 40, message: "Valor debe ser entero, positivo y menor o igual a 40." }
end
