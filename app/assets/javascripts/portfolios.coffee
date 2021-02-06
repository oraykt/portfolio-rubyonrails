# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

sortReady = undefined
set_positions = undefined

set_positions = ->
  $(".card").each (index) ->
    $(this).attr 'data-pos', index + 1
    return
  return

sortReady = ->
  set_positions()
  $(".sortable").sortable()
  $(".sortable").sortable().bind 'sortupdate', (arg1, ui) ->
    updated_order = []
    set_positions()
    $(".card").each (index) ->
      updated_order.push
        id: $(this).data("id")
        position: index + 1
      return
    $.ajax
      beforeSend: (ajax) ->
        ajax.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'))
        return
      type: "PUT"
      url: "/portfolios/sort"
      data: order: updated_order
    return
  return

$(document).ready sortReady