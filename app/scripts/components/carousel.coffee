mlsCarouselController = ()->
  this.images = [
    {url:"res/slider1.png", active:1},
    {url:"res/slider2.png"}, 
    {url:"res/slider3.png"} 
  ]
  console.log(this)
  
  return this
  
app.component 'mlsCarousel',
    templateUrl: 'views/directives/carousel.html'
    controller: mlsCarouselController


