app.factory 'PostersFctr', ->

  class PosterImage
    constructor: (src, url) ->
      image = new Image()
      image.onload = ->
        image.loaded = true
        return undefined
      image.onerror = ->
        return false

      image.src = src
      image.url = url
      return image

    @getImages = (images) ->
      resultimages = []
      for image in images
        resultimages.push new PosterImage(image.src, image.url)
      return resultimages

  return PosterImage
