class GoogleMaps.LocationNew
  @init: ->
    @bind()

  @bind: ->
    $('.save-polygon').addClass('disabled') if ($("input[name='location[name]']").val().length == 0)
    $("input[name='location[name]']").on 'keyup', disabledToggleClass
    setTimeout( () ->
      GoogleMaps.ShowMap.init(triangleCoordsArray(), true, true)
    , 500)

    $('.save-polygon').on 'click', setPolygon

  triangleCoordsArray= () ->
    return if (typeof gon != 'undefined') then gon.coordinates[0].slice(0, -1) else [[33.5185, -111.90236],[33.51736,-111.96313],[33.48286,-111.96296],[33.483,-111.90133]]

  disabledToggleClass= () ->
    if $(this).val().trim().length > 0 then $('.save-polygon').removeClass('disabled') else $('.save-polygon').addClass('disabled')

  setPolygon= () ->
    $("input[name='location[area]']").val(GoogleMaps.ShowMap.polygonArray())