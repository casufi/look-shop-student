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
    if self.activeimage == index
      return true
    else
      return false

  # Now preload all images
  @isCacheImg = (index) ->
    return true
    # Planned to cache only 3 closes images
    ###
    if self.activeimage == index || self.activeimage+1 == index||self.activeimage-1 == index||(self.activeimage == 0 && index == self.images.length-1)||(self.activeimage == self.images.length-1 && index == 0)
      return true
    return false
    ###

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
