@ProductCard = React.createClass
  displayName: 'ProductCard'

  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.data.id
      React.DOM.td null, @props.data.name
      React.DOM.td null,  @props.data.sku
      React.DOM.td null,  @props.data.category.name

