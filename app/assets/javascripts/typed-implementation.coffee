ready1 = ->
  new Typed '.typed-home-header',
    strings: [
      'Web Application Developer'
    ]
    typeSpeed: 140
  return
$(document).on 'turbolinks:load', ready1

ready2 = ->
  new Typed '.typed-home',
    strings: [
      'An ambitious software developer with good management skills, seeking a challenging position in the IT industry to pursue a highly rewarding career and healthy work environment where I can enhance my skills and knowledge along with organization objectives and growth.'
    ]
    typeSpeed: 10
  return
$(document).on 'turbolinks:load', ready2