class SvitlaTest.Views.Campaign extends Backbone.View
  tagName: 'li'
  template: JST['campaigns/campaign']
  render: ->
    $(@el).html(@template(campaign: @model))
    this

