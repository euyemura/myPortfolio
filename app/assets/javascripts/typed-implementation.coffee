ready = ->
  Typed.new '.element',
    strings: [
      'Thanks for stopping by!'
      "Grab a drink and check out my site!"
    ]
    typeSpeed: 0
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready
