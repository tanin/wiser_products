@ProductCard = React.createClass
  displayName: 'ProductCard'

  _handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/products/#{ @props.data.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteProduct @props.data

  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.data.id
      React.DOM.td null, @props.data.name
      React.DOM.td null,  @props.data.sku
      React.DOM.td null,  @props.data.category.name
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @_handleDelete
          'Delete'


