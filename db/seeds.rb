CATEGORIES = %w(red green blue grey)

CATEGORIES.each do |category|
  Category.create!(name: category)
end

(1..1000).step(1) do |i|
  Product.create!(
    name: "name_#{i}",
    sku: rand(36**6).to_s(36),
    category: Category.order("RANDOM()").first
  )
end
