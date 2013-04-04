class SvitlaTest.Views.CampaignsIndex extends Backbone.View

  template: JST['campaigns/index']

  render: ->
    $(@el).html(@template(campaigns: "Campaigns go here"))
    this

