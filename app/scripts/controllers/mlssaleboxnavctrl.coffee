app.controller 'mlsSaleBoxNavCtrl', (MlsSaleBoxFactory, $attrs) ->
  ctrl = this
  ctrl.id = $attrs.boxid

  mlssalebox_ = MlsSaleBoxFactory.getMlsSaleBoxById(ctrl.id)

  mlssalebox_
    .then (response) ->
      ctrl.mlssalebox = response
      if ctrl.mlssalebox.getCategories()
        ctrl.categories = ctrl.mlssalebox.categories

  @rightByOne = ->
    if ctrl.mlssalebox
      ctrl.mlssalebox.emitEvent('rightone')

  @leftByOne = ->
    if ctrl.mlssalebox
      ctrl.mlssalebox.emitEvent('leftone')

  @changeActiveCategory = (category) ->
    if not category.active
      for category_ in ctrl.categories
        if category_ == category
          category_.active = true
        else
          category_.active = false
      ctrl.opened = false
      if ctrl.mlssalebox
        ctrl.mlssalebox.emitEvent('categorychange')
    return undefined

  return ctrl
