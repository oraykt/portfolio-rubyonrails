ready = ->
  new Typed '.typed-home',
    strings: [
      'An ambitious software developer with good management skills, seeking a challenging position in the IT industry to pursue a highly rewarding career and healthy work environment where I can enhance my skills and knowledge along with organization objectives and growth.'
    ]
    typeSpeed: 35
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready