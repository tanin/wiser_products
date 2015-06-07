@Paginator = React.createClass
  displayName: 'Paginator'

  _handleOnClick: (pageNumber) ->
    @props.onPaginate(pageNumber)

  render: ->
    if @props.totalPages < 1
      React.div

    React.DOM.ul
      className: 'pagination'
      for i in [1..@props.totalPages]
        React.DOM.li
          key: i
          React.createElement PaginatorLink, pageNumber: i, onPaginatorLinkClick: @_handleOnClick
