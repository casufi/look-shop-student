app.controller 'mlsSaleBoxCtrl', (MlsSaleBoxFactory, $attrs, $element) ->

  ctrl = this
  ctrl.id = $attrs.boxid
  ctrl.tag = $attrs.boxtag

  @mlssalebox = MlsSaleBoxFactory.getNewMlsSaleBox(ctrl.id, ctrl.tag)

  currentposition = 0;

  listenerleft = ->
    totallwidth = $element[0].getBoundingClientRect().width
    elementwidth = $element[0].querySelectorAll('.position')[0].getBoundingClientRect().width + 2*15
    #Set margin to 15 because don`t know how to get it from DOM (not CSS)
    elementswidth = elementwidth * ctrl.mlssalebox.items.length
    minoffset = totallwidth - elementswidth

    elem = $element[0].querySelector('.positions')
    elem.classList.add('animate')
    currentposition = currentposition - elementwidth
    if currentposition  < minoffset
      currentposition = minoffset
    elem.style.transform = 'translateX('+currentposition+'px)'

  listenerright = ->
    elem = $element[0].querySelector('.positions')
    elementwidth = $element[0].querySelectorAll('.position')[0].getBoundingClientRect().width + 2*15
    currentposition = currentposition + elementwidth
    if currentposition > 0
      currentposition = 0
    elem.classList.add('animate')
    elem.style.transform = 'translateX('+currentposition+'px)'

  @mlssalebox.on('leftone', listenerleft)
  @mlssalebox.on('rightone', listenerright)

  @moveLeftByOne = ->
    @mlssalebox.emitEvent('leftone')

  @moveRigthByOne = ->
    @mlssalebox.emitEvent('rightone')

  return ctrl
