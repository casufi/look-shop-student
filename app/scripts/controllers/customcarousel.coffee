app.controller 'CustomCarouselCtrl',  ->
  @images = [
    {src:"res/slider1.png", url:"/"},
    {src:"res/Placeholder2.jpeg", url:"/"},
    {src:"https://unsplash.it/1200/440/?random=1" },
    {src:"https://unsplash.it/1200/440/?random=2", url:"/"},
    {src:"https://unsplash.it/1200/440/?random=3"},
    {src:"https://unsplash.it/1200/440/?random=4", url:"/"},
    {src:"https://unsplash.it/1200/440/?random=5"},
  ]
  @activeimage = 0
  @direct = 'left'
  self = this

  @isActiveImg = (index) ->
    return self.activeimage == index

  @setActiveNext = ->
    self.direct = 'right'
    self.activeimage++
    if self.activeimage >= self.images.length
      self.activeimage = 0
    return undefined

  @setActivePrevious = ->
    self.direct = 'left'
    self.activeimage--
    if self.activeimage < 0
      self.activeimage = self.images.length - 1
    return undefined

  @setActiveIndex = (index) ->
    if self.activeimage > index
      self.direct = 'left'
    if self.activeimage < index
      self.direct = 'right'
    self.activeimage=index
    return undefined

  return this
