class ProductsController < InheritedResources::Base
  respond_to :html, :json
  actions :index, :update, :destroy
  has_scope :by_category

  def index
    index! do |format|
      format.json do
        render json: {
          products: collection.as_json,
          meta: {
            current_page: collection.current_page,
            next_page: collection.next_page,
            prev_page: collection.prev_page,
            total_pages: collection.total_pages,
            total_count: collection.total_count
          }
        }
      end
    end
  end

  protected

  def collection
    get_collection_ivar || set_collection_ivar(end_of_association_chain.page(params[:page]))
  end
end
