require 'rails_helper'

describe Product, type: :model do
  let(:product) { create(:product) }

  describe :validations do
    context :name do
      it_should_behave_like "a string field validator", :name, 32
    end
  end
end
