@Paginator = React.createClass
  displayName: 'Paginator'
  _handleOnClick: (pageNumber) ->
    @props.onPaginate(pageNumber)
  render: ->
    if @props.totalPages > 1
      <ul className="pagination">
        {
          for i in [1..@props.totalPages]
            <li key={i}>
              {
                if i == @props.currentPage
                  <span className="visitedPage">{i}</span>
                else
                  <PaginatorLink pageNumber={i} onPaginatorLinkClick={@_handleOnClick} />
              }
            </li>
        }
      </ul>
    else
      <div>&nbsp;</div>
