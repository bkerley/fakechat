# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ($)->
  chat_form = $('#chat_form')
  return unless chat_form.length == 1
  uuid = chat_form.children('#uuid').val()
  chat_input = chat_form.children('#chat')
  submit = chat_form.children('input[type="submit"]')
  submit.removeData('disable-with').removeAttr('data-disable-with')

  template = $('#template').html()
  transcript = $('#transcript')

  channel = App.cable.subscriptions.create { channel: 'ChatChannel', uuid: uuid },
    received: (data) ->
      lines = template.
        replace('WAS_SAID', data.was_said).
        replace('REPLY', data.reply)
      transcript.append(lines)
      chat_input.val('')

  chat_form.submit (event)->
    channel.send message: chat_input.val()
    event.preventDefault()
    submit.prop('disabled', false)
