class SvitlaTest.Routers.Campaigns extends Backbone.Router
  routes:
    "": "index"
    "campaigns": "index"
    "campaigns/:id": "show"


  index: ->
    view = new SvitlaTest.Views.CampaignsIndex()
    $('#container').html(view.render().el)
  show: (id) ->
    alert "show campaign #{id}"
