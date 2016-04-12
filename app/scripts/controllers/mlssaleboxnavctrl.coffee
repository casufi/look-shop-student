app.controller 'mlsSaleBoxNavCtrl', (MlsSaleBoxFactory, $attrs) ->
  ctrl = this
  ctrl.id = $attrs.boxid

  mlssalebox_ = MlsSaleBoxFactory.getMlsSaleBoxById(ctrl.id)

  mlssalebox_
    .then (response) ->
      ctrl.mlssalebox = response
      ctrl.categories = ctrl.mlssalebox.getCategories()

  @rightByOne = ->
    if ctrl.mlssalebox
      ctrl.mlssalebox.emitEvent('rightone')

  @leftByOne = ->
    if ctrl.mlssalebox
      ctrl.mlssalebox.emitEvent('leftone')

  return ctrl
