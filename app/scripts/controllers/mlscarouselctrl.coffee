app.controller 'mlsCarouselController',  ->
  @images = [
    {src:"res/slider1.png", url:"/"},
    {src:"res/Placeholder2.jpeg", url:"/"},
    {src:"https://unsplash.it/1200/440/?random=1", url:"/"},
    {src:"https://unsplash.it/1200/440/?random=2", url:"/"},
    {src:"https://unsplash.it/1200/440/?random=3", url:"/"},
    {src:"https://unsplash.it/1200/440/?random=4"},
    {src:"https://unsplash.it/1200/440/?random=5"},
  ]
  @activeimage = 0
  @direct = 'left'
  ctrl = this

  @isActiveImg = (index) ->
    if ctrl.activeimage == index
      return true
    else
      return false

  # Now preload all images
  @isCacheImg = (index) ->
    return true
    # Planned to cache only 3 closes images
    ###
    if ctrl.activeimage == index || ctrl.activeimage+1 == index||ctrl.activeimage-1 == index||(ctrl.activeimage == 0 && index == ctrl.images.length-1)||(ctrl.activeimage == ctrl.images.length-1 && index == 0)
      return true
    return false
    ###

  @setActiveNext = ->
    ctrl.direct = 'right'
    ctrl.activeimage++
    if ctrl.activeimage >= ctrl.images.length
      ctrl.activeimage = 0
    return undefined

  @setActivePrevious = ->
    ctrl.direct = 'left'
    ctrl.activeimage--
    if ctrl.activeimage < 0
      ctrl.activeimage = ctrl.images.length - 1
    return undefined

  @setActiveIndex = (index) ->
    if ctrl.activeimage > index
      ctrl.direct = 'left'
    if ctrl.activeimage < index
      ctrl.direct = 'right'
    ctrl.activeimage=index
    return undefined

  return this
