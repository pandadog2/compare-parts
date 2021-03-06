class Part < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :car_model
  belongs_to :part_name
  belongs_to :material
  belongs_to :supplier
  has_many_attached :images

  with_options presence: true do
    validates :images, :product_number, :thickness, :weight, :approval_date
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates  :part_name_id, :material_id, :supplier_id
  end

  validates :product_number, format: { with: /\A[0-9]{5}-[0-9]{5}\z/, message: 'is 5 digits-5 digits (half-width number)' }, uniqueness: { case_sensitive: true }
  validates :thickness, numericality: true, format: { with: /\A[0-9]{0,2}\.[0-9]{2}\z/, message: 'is 2 digits for the decimal part and 2 digits or less for the natural number part' }
  validates :weight, numericality: true, format: { with: /\A[0-9]{0,5}\.[0-9]{2}\z/, message: 'is 2 digits for the decimal part and 5 digits or less for the natural number part' }
  validates :images, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..2.megabytes }

  validate :approval_date_cannot_be_in_the_future
  validate :reference_parts_and_product_number_must_not_be_the_same

  def approval_date_cannot_be_in_the_future
    if approval_date > Date.today
      errors.add(:approval_date, 'is cannot be in the future')
    end
  end
  def reference_parts_and_product_number_must_not_be_the_same
    if reference_parts == product_number
      errors.add(:reference_parts, 'and product number must not be the same')
    end
  end
end
