define ['backbone'], (Backbone) ->
  class Map extends Backbone.View

    instance = null

    @get: ->

      instance ?= @instance()

    @instance = ->
      myOptions =
        center: new google.maps.LatLng 41.892915, -87.635912
        zoom: 14
        mapTypeId: google.maps.MapTypeId.ROADMAP
        disableDefaultUI: true
        styles: @styles
      map = new google.maps.Map $('#map-canvas')[0], myOptions
      transitLayer = new google.maps.TransitLayer()
      transitLayer.setMap(map)
      opt = { minZoom: 12, maxZoom: 16 }
      map.setOptions(opt)
      return map

    @styles = [
      {
        featureType: "road.highway"
        elementType: "labels.icon"
        stylers: [visibility: "off"]
      }
      {
        featureType: "road.arterial"
        elementType: "labels.text.fill"
        stylers: [
          {
            weight: 0.1
          }
          {
            visibility: "off"
          }
        ]
      }
      {
        featureType: "road.arterial"
        elementType: "labels.text.fill"
        stylers: [visibility: "off"]
      }
      {
        featureType: "road.arterial"
        elementType: "labels.text.stroke"
        stylers: [visibility: "off"]
      }
      {
        featureType: "poi"
        elementType: "labels.icon"
        stylers: [visibility: "off"]
      }
      {
        featureType: "poi"
        elementType: "geometry.fill"
        stylers: [visibility: "off"]
      }
      {
        featureType: "poi"
        elementType: "labels.text.fill"
        stylers: [visibility: "off"]
      }
      {
        featureType: "water"
        elementType: "geometry"
        stylers: [
          {
            visibility: "on"
          }
          {
            color: "#82dce9"
          }
          {
            lightness: 4
          }
          {
            saturation: -4
          }
        ]
      }
      {
        featureType: "road.highway"
        stylers: [visibility: "off"]
      }
      {
        elementType: "labels.text"
        stylers: [
          {
            visibility: "off"
          }
          {
            color: "#643480"
          }
          {
            invert_lightness: true
          }
        ]
      }
      {
        featureType: "landscape"
        stylers: [color: "#c5bcb8"]
      }
      {
        featureType: "transit.station"
        elementType: "labels.icon"
        stylers: [visibility: "off"]
      }
    ]
