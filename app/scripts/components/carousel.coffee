mlsCarouselController = ()->
  @images = [
    {url:"res/slider1.png"},
    {url:"res/Placeholder2.jpeg"},
    {url:"http://placekitten.com/1200/440"},
    {url:"http://placeholdit.imgix.net/~text?txtsize=300&txt=place&w=1200&h=440&fm=png"}
  ]
  @activeimage = 0
  @direct = ''
  ctrl = this

  @isActiveImg = (index) ->
    if ctrl.activeimage == index
      return true
    else
      return false

  # Now preload all images
  @isCacheImg = (index) ->
    return true

    if ctrl.activeimage == index || ctrl.activeimage+1 == index||ctrl.activeimage-1 == index||(ctrl.activeimage == 0 && index == ctrl.images.length-1)||(ctrl.activeimage == ctrl.images.length-1 && index == 0)
      return true
    else
      return false

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

app.component 'mlsCarousel',
    templateUrl: 'views/directives/carousel.html'
    controller: mlsCarouselController


