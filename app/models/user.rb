class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :car_models
  has_many :parts
       
  validates :name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角で入力してください" }
end
