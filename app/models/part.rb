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

  validates :product_number, format: { with: /\A[0-9]{5}-[0-9]{5}\z/, message: "is 5 digits-5 digits (half-width number)" }, uniqueness: { case_sensitive: true }
  validates :thickness, :weight, numericality: true, format: { with: /\A[0-9]{0,6}\.[0-9]{2}\z/, message: "is 2 digits for the decimal part and 6 digits or less for the natural number part" }
end
