require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:product) { create(:product) }
  let(:category) { create(:category) }

  describe :validations do
    context :name do
      it_should_behave_like "a string field validator", :name, 32
    end
  end
end
