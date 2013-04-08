class SvitlaTest.Views.Campaign extends Backbone.View
  tagName: 'li'
  template: JST['campaigns/campaign']
  events:
    'click a.delete': 'deleteArticle'
  render: ->
    $(@el).html(@template(campaign: @model))
    this
  initialize: ->
     @model.on('destroy',@remove,this)

  deleteArticle: (event)->
    event.preventDefault()
    if confirm 'Delete this campaign?'
      @model.destroy()

