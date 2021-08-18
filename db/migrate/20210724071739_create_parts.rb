class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.integer    :part_name_id,   null: false
      t.string     :product_number, null: false
      t.integer    :material_id,    null: false
      t.string     :thickness,      null: false
      t.string     :weight,         null: false
      t.integer    :supplier_id,    null: false
      t.date       :approval_date,  null: false
      t.references :user,           null: false, foreign_key: true
      t.references :car_model,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
