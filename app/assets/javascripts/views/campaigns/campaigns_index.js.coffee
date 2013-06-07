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
    new_element = '<p class="country_element">Country <input type="text" class="country" name="[info][]" /> Languages <input id="info1" class="languages" name="[info][]" /></p>'
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

  clearFields: (id) ->
    $('input[type="text"]', '#'+id).each ->
      $(this).val('')

  validateForm: (id)->
    inputElements = $('form#'+id).find(':input')
    ret= true
    inputElements.each ->
      ret = false  if $(this).val() is ""
    ret
  createCampaign: (e) ->
    _this= @
    e.preventDefault()
    # unless @validateForm("new_campaign")
    #   alert "All fields need to be filled!"
    #   return false
    attributes =
      info: @getCountries()
      time_start: @$('#start').val()
      time_end: @$('#end').val()
    @collection.create attributes,
      # wait: true
      success: ->
        console.log 'success'
        @$('#errors').text('Campaign created!').addClass('correct')
        @$('#create').removeAttr('disabled');
        _this.clearFields('new_campaign')
      error: -> @handleError
  handleError: (campaign,error) ->
    @$('#create').removeAttr('disabled');
    @$('#errors').html(error)
    # @$('#create').removeAttr('disabled');
    # @$('#errors').html(error)
    # if response.status == 422
    #   @$('#create').removeAttr('disabled');
    #   errors = $.parseJSON( response.resonseText).errors
    #   for attribute, messages of errors
    #     errorText +=  "#{attribute} #{message} <br />" for message in messages
    #   @$('#errors').html(errorText)


  initialize: ->
    @collection.on('reset', @render,this)
    @collection.on('add', @appendCampaign ,this)
    @collection.on( "invalid", @handleInvalidState)
  handleInvalidState: (model, error) ->
    console.log "validation"
    console.log model
    console.log error
  render: ->
    $(@el).html(@template())
    @collection.each(@appendCampaign)
    this
  appendCampaign: (campaign) ->
    view = new SvitlaTest.Views.Campaign(model: campaign)
    $('#running_campaigns').append(view.render().el)

