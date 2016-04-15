app.factory 'SaleBoxFctr', ($q) ->

  self = @
  saleboxes = {}

  class SaleItem
    constructor: (id, title, price)->
      @id = id
      @title = title
      @price = price
      @url = "/res/Dress.png"
      @sale = Math.floor(Math.random() * 9) % 2

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
    new SaleItem(11, 'hot short', 21)
  ]



  class SaleBox extends EventEmitter
    
    @.prototype.getCategories = ->
      this.categories = [
        {name:"what`s hot", active: true},
        {name:"designers"},
        {name:"featured"},
        {name:"latest"}
      ]
      return this.categories

    @.prototype.loadItems = ->
      @items.push items...
      return undefined

    constructor: (id, tag, lazy) ->
      self = this
      @id = id
      @tag = tag
      @items = []
      saleboxes[id] = @
      return undefined

    @getSaleBox = (id, tag)->
      return saleboxes[id] or new SaleBox(id, tag)

  return SaleBox
