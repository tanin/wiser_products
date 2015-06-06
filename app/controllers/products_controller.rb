class ProductsController < InheritedResources::Base
  respond_to :html, :json, :js
  actions :all
end
