app.controller 'mlsSaleBox', (SaleBoxSvc)->
  saleBoxSvc = SaleBoxSvc
  console.log($scope)

app.directive 'mlsSaleBox', ()->
  directive =
    restrict: 'EA'
    rewrite: true
    scope:
      category: '@category'
    templateUrl: '/views/directives/salebox.html'
  return directive
