'use strict'

destBtn = document.querySelectorAll('.dest-btn')
busTimeLists = document.getElementById('bus-time-lists')

_i = 0
len = destBtn.length
while _i < len
  destBtn[_i].addEventListener 'click', (e) ->
    destVal = e.target.getAttribute('value')
  _i++
