@ProductCard = React.createClass
  displayName: 'ProductCard'
  render: ->
    <tr className="product">
      <td>
        {@props.data.id}
      </td>
      <td>
        {@props.data.name}
      </td>
      <td>
        {@props.data.sku}
      </td>
      <td>
        {@props.data.category.name}
      </td>
    </tr>
