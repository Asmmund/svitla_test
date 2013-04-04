class SvitlaTest.Routers.Campaigns extends Backbone.Router
  routes:
    "": "index"
    "campaigns": "index"
    "campaigns/:id": "show"

  initialize: ->
    @collection = new SvitlaTest.Collections.Campaigns()
    @collection.fetch()

  index: ->
    view = new SvitlaTest.Views.CampaignsIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (id) ->
    alert "show campaign #{id}"
