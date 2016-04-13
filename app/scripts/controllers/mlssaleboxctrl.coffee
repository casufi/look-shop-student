app.controller 'mlsSaleBoxCtrl', (MlsSaleBoxFactory, $attrs, $element) ->

  totallWidth = $element[0].getBoundingClientRect().width

  ctrl = this
  ctrl.id = $attrs.boxid
  ctrl.tag = $attrs.boxtag
  ctrl.navigation = $attrs.navigation*1

  currentPosition = 0

  @mlssalebox = MlsSaleBoxFactory.getNewMlsSaleBox(ctrl.id, ctrl.tag)

  if ctrl.navigation
    moveSlider = (direction) ->
      elements = $element[0].querySelector('.positions')
      elements.classList.remove('animate')

      elem = $element[0].querySelectorAll('.position')[0]
      elemCss = window.getComputedStyle(elem)
      elementWidth = elem.getBoundingClientRect().width + parseInt(elemCss.marginLeft) + parseInt(elemCss.marginRight)

      if direction == 'left'
        elementsWidth = elementWidth * ctrl.mlssalebox.items.length
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
      for cat in ctrl.mlssalebox.categories
        if cat.active
          console.log(cat.name)

    @mlssalebox.on('leftone', listenerLeft)
    @mlssalebox.on('rightone', listenerRight)
    @mlssalebox.on('categorychange', categoryChanged)

    @moveLeftByOne = ->
      @mlssalebox.emitEvent('leftone')

    @moveRigthByOne = ->
      @mlssalebox.emitEvent('rightone')

  return ctrl
