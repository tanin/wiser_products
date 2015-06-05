FactoryGirl.define do
  factory :category do
    name "Green"
  end

  factory :product do
    name "Supadupa Product"
    sku  "KlJ100"
    association :category, factory: :category
  end
end
