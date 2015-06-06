@Products = React.createClass
  displayName: 'Products'

  getInitialState: ->
    didFetchData: false
    products: []
    meta:
      total_pages: 0
      current_page: 1
      total_count: 0
    fetchData:
      page: 1

  componentDidMount: ->
    @_fetchProducts({})

  _fetchProducts: (data)->
    url = @props.products_path

    unless @props.by_category == null
      url = "#{@props.products_path}?by_category=#{@props.by_category}"

    $.ajax
      url: url
      dataType: 'json'
      data: @state.fetchData
    .done @_fetchDataDone
    .fail @_fetchDataFail

  _fetchDataDone: (data, textStatus, jqXHR) ->
    @setState
      didFetchData: true
      products: data.products
      meta: data.meta

  _fetchDataFail: (xhr, status, err) =>
    console.error @props.url, status, err.toString()

  _handleOnPaginate: (pageNumber) ->
    @state.fetchData.page = pageNumber
    @_fetchProducts()

  render: ->
    cardsNode = @state.products.map (product) ->
      <ProductCard key={product.id} data={product}/>

    noDataNode =
      <div className="warning">
        <span className="fa-stack">
          <i className="fa fa-meh-o fa-stack-2x"></i>
        </span>
        <h4>No products found...</h4>
      </div>

    <div>
      <table className="table">
        <thead>
          <tr>
            <th>id</th>
            <th>Name</th>
            <th>SKU</th>
            <th>Category</th>
          </tr>
        </thead>
        <tbody>
        {
          if @state.products.length > 0
            {cardsNode}
          else if @state.didFetchData
            {noDataNode}
        }
        </tbody>
      </table>
      <Paginator totalPages={@state.meta.total_pages} currentPage={@state.meta.current_page} onPaginate={@_handleOnPaginate}/>
    </div>
