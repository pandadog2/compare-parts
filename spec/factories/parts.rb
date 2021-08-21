FactoryBot.define do
  factory :part do
    part_name_id          { Faker::Number.between(from: 2, to: 8) }
    product_number        { '11111-11111' }
    material_id           { Faker::Number.between(from: 2, to: 8) }
    thickness             { '10.00' }
    weight                { '500.00' }
    supplier_id           { Faker::Number.between(from: 2, to: 8) }
    approval_date         { Faker::Date.backward }
    reference_parts       { '00000-00000' }
    association :user
    association :car_model

    after(:build) do |part|
      part.images.attach(io: File.open('public/images/tacoma.jpg'), filename: 'tacoma.jpg')
    end
  end
end
