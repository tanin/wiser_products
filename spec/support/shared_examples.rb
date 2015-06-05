shared_examples_for "a string field validator" do |field_name, chars_count|
  before(:each) do
    expect(product).to be_valid
  end

  it "should validate #{field_name} presence" do
    product.send("#{field_name}=", nil)
    expect(product.valid?).to eq(false)
  end

  it "should validate #{field_name} length" do
    product.send("#{field_name}=", "x" * (chars_count.to_i + 1))
    expect(product.valid?).to eq(false)
    expect(product.errors[field_name].first).to eq("#{chars_count} characters is the maximum allowed")
  end
end
