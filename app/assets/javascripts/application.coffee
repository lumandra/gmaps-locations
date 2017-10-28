
#= require jquery
#= require jquery_ujs
#= require rails-ujs
#= require bootstrap
#= require underscore
#= require gmaps/google
#= require_self
#= require_tree .


window.GoogleMaps = {}

class GoogleMaps.Application
  @init: ->

ready = ->
  data       = $('body').data()
  page       = data.page
  controller = data.controller

  GoogleMaps.Application.init()
  GoogleMaps[page].init() if GoogleMaps[page]?

  controller.split('_').concat('').reduce (sum, part) ->
    GoogleMaps[sum].init() if GoogleMaps[sum]
    "#{sum}_#{part}"

$(document).ready(ready)
$(document).on("page:load", ready)
$(document).on('page:restore', ready)