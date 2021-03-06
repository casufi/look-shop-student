app.controller 'SaleBoxCtrl', (SaleBoxFctr, $attrs, $element) ->
  self = @
  @id = $attrs.boxid
  @tag = $attrs.boxtag
  @navigation = $attrs.navigation*1
  @salebox = SaleBoxFctr.getSaleBox(self.id, self.tag)
  @salebox.loadItems()

  currentPosition = 0
  totallWidth = $element[0].getBoundingClientRect().width

  moveSlider = (direction) ->
    elements = $element[0].querySelector('.positions')
    elements.classList.remove('animate')

    elem = $element[0].querySelectorAll('.position')[0]
    elemCss = window.getComputedStyle(elem)
    elementWidth = elem.getBoundingClientRect().width + parseInt(elemCss.marginLeft) + parseInt(elemCss.marginRight)

    switch direction
      when 'left' then do ->
        elementsWidth = elementWidth * self.salebox.items.length
        minOffset = totallWidth - elementsWidth
        currentPosition = currentPosition - elementWidth
        if currentPosition < minOffset
          currentPosition = minOffset
      when 'right' then do ->
        currentPosition = currentPosition + elementWidth
        if currentPosition > 0
          currentPosition = 0
    elements.classList.add('animate')
    elements.style.transform = 'translateX('+currentPosition+'px)'

  listenerLeft = ->
    moveSlider('left')

  listenerRight = ->
    moveSlider('right')

  categoryChanged = ->
    for cat in self.salebox.categories
      if cat.active
        console.log(cat.name)

  @moveLeftByOne = ->
    @salebox.trigger('leftone')

  @moveRigthByOne = ->
    @salebox.trigger('rightone')

  init = ->
    window.addEventListener "resize", ->
      totallWidth = $element[0].getBoundingClientRect().width

    if self.navigation
      self.salebox.on('leftone', listenerLeft)
      self.salebox.on('rightone', listenerRight)
      self.salebox.on('categorychange', categoryChanged)

  init()

  @.$onDestroy = ->
    #Probably it is not necessary because events are placed on object salebox that will be destroyed
    self.salebox.off('leftone')
    self.salebox.off('rightone')
    self.salebox.off('categorychange')

  return self
