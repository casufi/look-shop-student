app.controller 'SaleBoxNavCtrl', (SaleBoxFctr, $attrs) ->
  self = @
  @id = $attrs.boxid

  @salebox = SaleBoxFctr.getSaleBox(self.id)
  @categories = @salebox.getCategories() 
  console.log({"salebox":@salebox})

  @rightByOne = ->
    if self.salebox
      self.salebox.emitEvent('rightone')

  @leftByOne = ->
    if self.salebox
      self.salebox.emitEvent('leftone')

  @changeActiveCategory = (category) ->
    if not category.active
      for category_ in self.categories
        if category_ == category
          category_.active = true
        else
          category_.active = false
      self.opened = false
      if self.salebox
        self.salebox.emitEvent('categorychange')
    return undefined

  return self
