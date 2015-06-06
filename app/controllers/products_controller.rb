class ProductsController < InheritedResources::Base
  respond_to :html, :json, :js
  actions :all
  has_scope :by_category
end
