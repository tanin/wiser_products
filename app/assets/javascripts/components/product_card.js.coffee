@ProductCard = React.createClass
  displayName: 'ProductCard'

  getInitialState: ->
    edit: false

  _handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  _handleDelete: (e) ->
    e.preventDefault()

    $.ajax
      method: 'DELETE'
      url: "/products/#{ @props.data.id }"
      dataType: 'json'
      success: () =>
        @props.handleDeleteProduct @props.data

  _handleEdit: (e) ->
    e.preventDefault()

    data =
      name: React.findDOMNode(@refs.name).value
      sku: React.findDOMNode(@refs.sku).value
      category_id: React.findDOMNode(@refs.category_id).value

    $.ajax
      method: 'PUT'
      url: "/products/#{ @props.data.id }"
      dataType: 'json'
      contentType: "application/json"
      data: JSON.stringify(product: data)
      success: (data) =>
        @setState edit: false
        @props.handleEditProduct @props.data, data


  recordForm: ->
      React.DOM.tr null,
        React.DOM.td null, @props.data.id
        React.DOM.td null,
          React.DOM.input
            className: 'form-control'
            type: 'text'
            defaultValue: @props.data.name
            ref: 'name'
        React.DOM.td null,
          React.DOM.input
            className: 'form-control'
            type: 'text'
            defaultValue: @props.data.sku
            ref: 'sku'
        React.DOM.td null,
          React.DOM.select { className: 'form-control', defaultValue: @props.data.category.id, ref: 'category_id' },
            for category in @props.categories
              React.DOM.option
                value: category.id
                children: category.name
        React.DOM.td null,
          React.DOM.a
            className: 'btn btn-default'
            onClick: @_handleEdit
            'Update'
          React.DOM.a
            className: 'btn btn-danger'
            onClick: @_handleToggle
            'Cancel'

  recordRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.data.id
      React.DOM.td null, @props.data.name
      React.DOM.td null,  @props.data.sku
      React.DOM.td null,  @props.data.category.name
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @_handleToggle
          'Edit'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @_handleDelete
          'Delete'

  render: ->
    if @state.edit
      @recordForm()
    else
      @recordRow()
