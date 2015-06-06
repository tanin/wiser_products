@PaginatorLink = React.createClass
  displayName: 'PaginatorLink'

  _handleOnClick: (e) ->
    e.preventDefault()
    @props.onPaginatorLinkClick(@props.pageNumber)

  render: ->
    React.DOM.a
      onClick: @_handleOnClick
      @props.pageNumber
