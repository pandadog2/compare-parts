class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :car_models
  has_many :parts

  validates :name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ーa-zA-Z +]+\z/, message: 'is other than numbers, double-byte alphabets, and double-byte spaces' }, presence: true, length: { maximum: 10 }
end
