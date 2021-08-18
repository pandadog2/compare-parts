FactoryBot.define do
  factory :car_model do
    car_model_code { '100A' }
    association :user
  end
end
