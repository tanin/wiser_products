CATEGORIES = %w(red green blue grey)

(1..1000).step(1) do |i|
  Product.create!(
    name: "name_#{i}",
    sku: rand(36**6).to_s(36),
    category: CATEGORIES.sample
  )
end
