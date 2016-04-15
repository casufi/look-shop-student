app.controller 'CustomCarouselCtrl', (PostersFctr) ->

  @images = PostersFctr.getImages [
      {src:"res/slider1.png", url:"/"},
      {src:"https://unsplash.it/1200/440/?random=6", url:"/"},
      {src:"https://unsplash.it/1200/440/?random=1" },
      {src:"https://unsplash.it/1200/440/?random=2", url:"/"},
      {src:"https://unsplash.it/1200/440/?random=3"},
      {src:"https://unsplash.it/1200/440/?random=4", url:"/"},
      {src:"https://unsplash.it/1200/440/?random=5"}
    ]

  @activeimage = 0
  @direct = 'left'
  self = this

  @isActiveImg = (index) ->
    return self.activeimage == index

  @setActiveNext = (recursion) ->
    recursion++ || recursion = 1
    self.direct = 'right'
    self.activeimage++

    if self.activeimage >= self.images.length
      self.activeimage = 0

    if not @images[self.activeimage].loaded && recursion < 3
      @setActiveNext(recursion)

    return undefined

  @setActivePrevious = (recursion)->
    self.direct = 'left'
    self.activeimage--

    if self.activeimage < 0
      self.activeimage = self.images.length - 1

    if not @images[self.activeimage].loaded && recursion < 3
      @setActivePrevious(recursion)

    return undefined

  @setActiveIndex = (index) ->
    if self.activeimage > index
      self.direct = 'left'
    if self.activeimage < index
      self.direct = 'right'
    self.activeimage=index

    if not @images[self.activeimage].loaded && recursion < 3
      @setActiveNext(1)

    return undefined

  return this
