class GoogleMaps.ShowMap
  $polygon = null
  $polygonArray = null
  @init: (triangleCoordsArray, draggable, editable) ->
    @setDefaultPolygonArray(triangleCoordsArray)
    @initMap(triangleCoordsArray, draggable, editable)
      
  @initMap: (triangleCoordsArray, draggable, editable)->
    triangleCoords = []
    bounds  = new google.maps.LatLngBounds()
    mapOptions =
      mapTypeId: google.maps.MapTypeId.RoadMap
    map = new (google.maps.Map)(document.getElementById('map'), mapOptions)

    $.each triangleCoordsArray, (i, v)->
      triangleCoords.push(new (google.maps.LatLng)(v[0],v[1]))
      bounds.extend(triangleCoords[i])
      map.fitBounds(bounds)
      map.panToBounds(bounds)

    $polygon = new (google.maps.Polygon)(
      path: triangleCoords
      draggable: draggable
      editable: editable
      strokeColor: '#FF0000'
      strokeOpacity: 0.8
      strokeWeight: 2
      fillColor: '#FF0000'
      fillOpacity: 0.35)
    $polygon.setMap map

    google.maps.event.addListener($polygon, "dragend", getPolygonCoords)
    google.maps.event.addListener($polygon.getPath(), "insert_at", getPolygonCoords)
    google.maps.event.addListener($polygon.getPath(), "set_at", getPolygonCoords)

  @polygonArray: ->
    return $polygonArray

  @setDefaultPolygonArray: (triangleCoordsArray) ->
    $polygonArray = '['
    $.each triangleCoordsArray, (i, v)->
      $polygonArray += "[#{v[0]},#{v[1]}],"
    deleteComma()

  getPolygonCoords = ()->
    len = $polygon.getPath().getLength()
    i = 0
    $polygonArray = '['
    while i < len
      $polygonArray += "[#{$polygon.getPath().getAt(i).toUrlValue(5)}],"
      i++
    deleteComma()

  deleteComma=() ->
    $polygonArray = $polygonArray.replace(/,(\s+)?$/, '')
    $polygonArray += ']'