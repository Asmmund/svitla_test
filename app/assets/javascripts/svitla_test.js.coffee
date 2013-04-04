window.SvitlaTest =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new SvitlaTest.Routers.Campaigns()
    Backbone.history.start()

$(document).ready ->
  SvitlaTest.initialize()
