class Part < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :car_model
  belongs_to :part_name
  belongs_to :material
  belongs_to :supplier
  has_one_attached :image

  with_options presence: true do
    validates :image, :product_number, :thickness, :weight
  end
  
  with_options presence: true, numericality: { other_than: 1 } do
    validates  :part_name_id, :material_id, :supplier_id
  end

  validates :product_number, format: { with: /\A[0-9]{5}-[0-9]{5}\z/, message: "は半角数字５桁-５桁で入力してください" }, uniqueness: true
  validates :thickness, :weight, numericality: true, format: { with: /\A[0-9]{0,6}\.[0-9]{2}\z/, message: "は整数部分6桁以内、小数部分2桁で入力してください" }
end
