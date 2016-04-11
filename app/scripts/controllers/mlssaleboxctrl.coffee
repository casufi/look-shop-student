app.controller 'mlsSaleBoxCtrl', (MlsSaleBoxFactory, $attrs, $element) ->

  ctrl = this
  ctrl.id = $attrs.boxid
  ctrl.tag = $attrs.boxtag

  @mlssalebox = MlsSaleBoxFactory.getNewMlsSaleBox(ctrl.id, ctrl.tag)

  listenerleft = ->
     console.log("left event")

  listenerright = ->
    console.log("rigth event")

  @mlssalebox.addListener('leftone', listenerleft)
  @mlssalebox.addListener('rightone', listenerright)

  @itemsScrollLeftByOne = ->
    return undefined

  @itemsScrollRightByOne = ->
    return undefined

  return ctrl
