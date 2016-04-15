app.controller 'SaleBoxCtrl', (SaleBoxFctr, $attrs, $element) ->
  currentPosition = 0

  totallWidth = $element[0].getBoundingClientRect().width
  window.addEventListener "resize", ->
    totallWidth = $element[0].getBoundingClientRect().width


  @id = $attrs.boxid
  @tag = $attrs.boxtag
  @navigation = $attrs.navigation*1
  self = @

  @salebox = SaleBoxFctr.getSaleBox(self.id, self.tag)
  @salebox.loadItems()

  if self.navigation
    moveSlider = (direction) ->
      elements = $element[0].querySelector('.positions')
      elements.classList.remove('animate')

      elem = $element[0].querySelectorAll('.position')[0]
      elemCss = window.getComputedStyle(elem)
      elementWidth = elem.getBoundingClientRect().width + parseInt(elemCss.marginLeft) + parseInt(elemCss.marginRight)

      if direction == 'left'
        elementsWidth = elementWidth * self.salebox.items.length
        minOffset = totallWidth - elementsWidth
        currentPosition = currentPosition - elementWidth
        if currentPosition  < minOffset
          currentPosition = minOffset
      if direction == 'right'
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

    @salebox.on('leftone', listenerLeft)
    @salebox.on('rightone', listenerRight)
    @salebox.on('categorychange', categoryChanged)

    @moveLeftByOne = ->
      @salebox.emitEvent('leftone')

    @moveRigthByOne = ->
      @salebox.emitEvent('rightone')

  return self
