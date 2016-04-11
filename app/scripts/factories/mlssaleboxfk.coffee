app.factory 'MlsSaleBoxFactory', ($q) ->

  fk = this
  fk.saleboxes = []

  class SaleItem
    constructor: (id)->
      @id = id
      @url = "/res/Dress.png"
      @sale = true


  items = [new SaleItem(1), new SaleItem(2), new SaleItem(3), new SaleItem(4), new SaleItem(5), new SaleItem(6), new SaleItem(7), new SaleItem(8), new SaleItem(9), new SaleItem(10), new SaleItem(11)]

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
