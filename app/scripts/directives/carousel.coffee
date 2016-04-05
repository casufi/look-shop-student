app.directive 'mlsCarousel', ->
  images = ["res/slider1.png", "res/slider2.png", "res/slider3.png" ]

  directive =
    templateUrl: 'views/directives/carousel.html'
    replace: true
    restrict: 'EA'
    scope: {}
    link: ($scope, $element, $attrs) ->
      btn_prev = angular.element($element).children()
      $scope.images = images
      console.log({"dscope":$scope})
      console.log({"element":btn_prev})

  return directive


