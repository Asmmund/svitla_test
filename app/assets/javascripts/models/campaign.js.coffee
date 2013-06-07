class SvitlaTest.Models.Campaign extends Backbone.Model
  initialize: ->
    @bind("error", @errorHandling)

  validate: (attrs) ->
    return "Please fill start time of the campaign."  unless attrs.time_start
    return "Please fill end time of the campaign."  unless attrs.time_end
    "Please fill Countrz & language fields."  unless attrs.info
  errorHandling: (model, event) ->
    @$('#create').removeAttr('disabled');
    @$('#errors').html(error)

