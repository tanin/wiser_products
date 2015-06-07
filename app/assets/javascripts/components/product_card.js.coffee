@ProductCard = React.createClass
  displayName: 'ProductCard'

  getInitialState: ->
    error: { name: '', sku: '' }
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

  test_max_chars: (value, max_chars_count) -> if (value != undefined) then value.length > max_chars_count
  test_min_chars: (value) -> if (value != undefined) then value.length == 0

  checkErrors: (value, id) ->
    chars_counts = {name: 32, sku: 6}
    @error = { name: '', sku: '' }

    if @test_max_chars(value, chars_counts[id])
      @error[id] = "#{id} field should not have more than #{chars_counts[id]} characters."
    else if @test_min_chars(value)
      @error[id] = "#{id} field should not be blank"

    @replaceState
      error: @error
      edit: true

  onChange: (e) ->
    @checkErrors(e.target.value, e.target.id)

  productForm: ->
      React.DOM.tr null,
        React.DOM.td null, @props.data.id
        React.DOM.td null,
          React.DOM.input
            className: 'form-control'
            id: 'name'
            type: 'text'
            defaultValue: @props.data.name
            ref: 'name'
            onChange: @onChange
          if @error != undefined
            React.DOM.span({className: 'error'}, @error["name"])
        React.DOM.td null,
          React.DOM.input
            className: 'form-control'
            id: 'sku'
            type: 'text'
            defaultValue: @props.data.sku
            ref: 'sku'
            onChange: @onChange
          if @error != undefined
            React.DOM.span({className: 'error'}, @error["sku"])
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

  productRow: ->
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
      @productForm()
    else
      @productRow()
