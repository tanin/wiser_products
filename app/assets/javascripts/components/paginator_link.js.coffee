@PaginatorLink = React.createClass
  displayName: 'PaginatorLink'

  _handleOnClick: (e) ->
    e.preventDefault()
    @props.onPaginatorLinkClick(@props.pageNumber)

  render: ->
    if @props.currentPage == @props.pageNumber
      React.DOM.span
        className: "visitedPage"
        @props.pageNumber
    else
      React.DOM.a
        className: "paginationLink"
        onClick: @_handleOnClick
        @props.pageNumber
