class CarModel < ApplicationRecord
  belongs_to :user
  has_many :parts

  validates :car_model_code, presence: true, format: { with: /\A[0-9]{3}[A-Z]{1}\z/, message: "は半角数字3桁+半角英字(大文字)1字で入力してください" }, uniqueness: true
end
