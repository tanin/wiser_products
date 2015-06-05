require 'rails_helper'

describe Product, type: :model do
  let(:product) { create(:product) }

  describe :validations do
    context :name do
      it_should_behave_like "a string field validator", :name, 32
    end

    context :sku do
      it_should_behave_like "a string field validator", :sku, 6

      it "should be uniq" do
        expect(product).to be_valid
        product_1 = build(:product)
        expect(product_1).to_not be_valid
        expect(product_1.errors[:sku].first).to eq("has already been taken")
      end
    end

    context :category do
      it_should_behave_like "a string field validator", :category, 10
    end
  end
end
