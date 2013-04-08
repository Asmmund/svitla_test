class SvitlaTest.Views.CampaignsIndex extends Backbone.View

  template: JST['campaigns/index']

  events:
    'submit form#new_campaign': 'createCampaign'
    'click a#add_country': 'addCountry'
    'click #modal': 'showModalWindow'
    'click .modal.corners>.close': 'closeModalWindow'
  closeModalWindow: (e) ->
    e.preventDefault()
    $('.modal.corners').hide()
  showModalWindow: (e)->
    e.preventDefault()
    $('.modal.corners').show()
  addCountry: (e) ->
    new_element = '<p class="country_element">Country <input class="country" name="[info][]" /> Languages <input id="info1" class="languages" name="[info][]" /></p>'
    e.preventDefault()
    @$('#country_list').append(new_element)
  getCountries: (e)->
    result = '{['
    $("#country_list>.country_element").each (i, element) ->
      country = $(element).find('.country')[0].value
      languages= $(element).find('.languages')[0].value
      result += '{"country":"'+country+ '", "languages":"'+languages+'"},'
    result = result.substring(0, result.length - 1)
    return result + ']}'

  validateForm: (id)->
    inputElements = $('form#'+id).find(':input')
    ret= true
    inputElements.each ->
      ret = false  if $(this).val() is ""
    ret
  createCampaign: (e) ->
    e.preventDefault()
    unless @validateForm("new_campaign")
      alert "All fields need to be filled!"
      return false
    attributes =
      info: @getCountries()
      time_start: @$('#start').val()
      time_end: @$('#end').val()
    @collection.create attributes,
      wait: true
      success: -> alert('created!')
      error: -> @handleError

  handleError: (campaign,response) ->
    if response.status == 422
      console.log '1'
      errors = $.parseJSON( response.resonseText).errors
      for attribute, messages of errors
        console.log '2'
        alert "#{attribute} #{message}" for message in messages


  initialize: ->
    @collection.on('reset', @render,this)
    @collection.on('add', @appendCampaign ,this)


  render: ->
    $(@el).html(@template())
    @collection.each(@appendCampaign)
    this
  appendCampaign: (campaign) ->
    view = new SvitlaTest.Views.Campaign(model: campaign)
    $('#running_campaigns').append(view.render().el)

