require 'rails_helper'

describe ProductsController, type: :controller do
  render_views

  let(:product) { create(:product) }
  let(:category) { create(:category, :for_update) }

  describe "GET #index" do
    before(:each) do
      expect(product).to be_valid
    end

    context 'json' do
      before do
        get :index
      end

      it "should be success" do
        expect(response).to be_success
      end

      it "should render index" do
        expect(subject).to render_template(:index)
      end
    end

    context 'json' do
      before do
        get :index, format: :json
        @body = JSON.parse(response.body)
      end

      it "should render json" do
        expect(@body.count).to eq(2)
      end

      it "should contain products" do
        expect(@body).to have_key("products")
      end

      it "should not be empty" do
        expect(@body["products"]).not_to be_empty
      end

      it "should contain meta" do
        expect(@body).to have_key("meta")
      end

      it "should not be blank" do
        expect(@body["meta"]).not_to be_blank
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      expect(product).to be_valid
    end

    it "destroys the requested product" do
      expect {
        delete :destroy, :id => product.to_param, format: :json
      }.to change(Product, :count).by(-1)
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { product: { name: 'new name', sku: 'SKU123', category_id: category.id } } }

      before do
        expect(product).to be_valid
        request.env["CONTENT_TYPE"] = "application/json"
        request.env["RAW_POST_DATA"] = new_attributes.to_json

        put :update, {id: product.to_param, format: :json}
      end

      it "updates the requested product" do
        product.reload
        expect(product.name).to eq("new name")
        expect(product.sku).to eq("SKU123")
        expect(product.category.name).to eq("red")
      end

      it "should return an updated product json" do
        expect(JSON.parse(response.body)["name"]).to eq("new name")
      end

      it "should contain an category" do
        expect(JSON.parse(response.body)["category"]).to_not be_blank
      end
    end

    context "with invalid params" do
      let(:new_attributes) { { product: { name: "x" * 33, sku: 'SKU123', category_id: category.id } } }

      before do
        expect(product).to be_valid
        request.env["CONTENT_TYPE"] = "application/json"
        request.env["RAW_POST_DATA"] = new_attributes.to_json

        put :update, {id: product.to_param, format: :json}
      end

      it "assigns the product as @product" do
        expect(assigns(:product)).to eq(product)
      end

      it "should return json with error" do
        expect(JSON.parse(response.body)["error"]).to eq("Cannot update product")
      end
    end
  end
end
