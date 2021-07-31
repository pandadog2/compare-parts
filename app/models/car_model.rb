class CarModel < ApplicationRecord
  belongs_to :user
  has_many :parts

  validates :car_model_code, presence: true, format: { with: /\A[0-9]{3}[A-Z]{1}\z/, message: "is 3 half-width numbers + 1 half-width alphabet (uppercase)" }, uniqueness: { case_sensitive: true }
end
