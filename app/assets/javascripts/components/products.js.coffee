@Products = React.createClass
  displayName: 'Products'

  getInitialState: ->
    didFetchData: false
    products: []

  componentDidMount: ->
    @_fetchProduct({})

  _fetchProduct: (data)->
    $.ajax
      url: @props.products_path
      dataType: 'json'
      data: data
    .done @_fetchDataDone
    .fail @_fetchDataFail

  _fetchDataDone: (data, textStatus, jqXHR) ->
    @setState
      didFetchData: true
      products: data

  _fetchDataFail: (xhr, status, err) =>
    console.error @props.url, status, err.toString()

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
