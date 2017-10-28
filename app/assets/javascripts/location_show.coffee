class GoogleMaps.LocationShow
  @init: ->
    @bind()
  
  @bind: ->
    setTimeout( () ->
      GoogleMaps.ShowMap.init(gon.coordinates[0].slice(0, -1), false, false)
    , 500)