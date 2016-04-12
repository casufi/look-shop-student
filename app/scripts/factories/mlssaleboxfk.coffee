app.factory 'MlsSaleBoxFactory', ($q) ->

  fk = this
  fk.saleboxes = []

  class SaleItem
    constructor: (id, title, price)->
      @id = id
      @title = title
      @price = price
      @url = "/res/Dress.png"
      @sale = true


  items = [
    new SaleItem(1, 'hot short', 11),
    new SaleItem(2, 'hot short', 12),
    new SaleItem(3, 'hot top', 13),
    new SaleItem(4, 'hot short', 14),
    new SaleItem(5, 'hot short', 15),
    new SaleItem(6, 'hot short', 16),
    new SaleItem(7, 'hot short', 17),
    new SaleItem(8, 'hot short', 18),
    new SaleItem(9, 'hot short', 19),
    new SaleItem(10, 'hot short', 20),
    new SaleItem(11, 'hot short', 21)]

  getCategories = ->
    return [
      {name:"what`s hot"},
      {name:"designers"},
      {name:"featured"},
      {name:"latest"}
    ]

  class MlsSaleBox extends EventEmitter
    constructor: (id, tag)->
      @id = id
      @tag = tag
      @items = items

      @getnextItems = ->
        newItems = []
        @items.push newItems
        return undefined

      fk.saleboxes[id] = @
      return undefined

  MlsSaleBox.prototype.getCategories = getCategories

  @getNewMlsSaleBox = (id, tag)->
    if fk.saleboxes[id]
      #Change tag
      return fk.saleboxes[id]
    return new MlsSaleBox(id, tag)

  @getMlsSaleBoxById = (id) ->
    result = $q (resolve, reject) ->
      if !fk.saleboxes[id]
        fk.saleboxes[id] = fk.getNewMlsSaleBox(id)
      resolve(fk.saleboxes[id])

    return result

  return this
