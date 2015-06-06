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

  _deleteProduct: (product) ->
    products = @state.products.slice()
    index = products.indexOf product
    products.splice index, 1
    @replaceState
      didFetchData: true
      products: products
      meta: @state.meta

  render: ->
    React.DOM.div
      className: 'products'
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'id'
            React.DOM.th null, 'Name'
            React.DOM.th null, 'SKU'
            React.DOM.th null, 'Category'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for product in @state.products
            React.createElement ProductCard, data: product, key: product.id, handleDeleteProduct: @_deleteProduct

      React.createElement Paginator, totalPages: @state.meta.total_pages, currentPage: @state.meta.current_page, onPaginate: @_handleOnPaginate
