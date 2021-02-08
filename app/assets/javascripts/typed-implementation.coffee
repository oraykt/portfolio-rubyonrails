ready = ->
  new Typed '.typed-home',
    strings: [
      'Web Application Developer'
    ]
    typeSpeed: 120
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready