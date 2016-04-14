do ->
  document.addEventListener "DOMContentLoaded", ->
    placeholder = document.getElementsByClassName 'splash'
    if placeholder[0]? and placeholder[0].style?
      placeholder[0].style.display='none'
