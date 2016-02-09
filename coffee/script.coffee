'use strict'

destBtn = document.querySelectorAll('.dest-btn')
busTimeLists = document.getElementById('bus-time-lists')

_i = 0
len = destBtn.length
while _i < len
  destBtn[_i].addEventListener 'click', (e) ->
    destVal = e.target.getAttribute('value')

    # 時刻表(json)の読み込み
    req = new XMLHttpRequest()
    req.open('GET', './static/bustime.json')
    req.send()

    # 受け取ったJSONのパース
    req.onload = () ->
      timeTables = JSON.parse( req.responseText )

      console.log busTime

  _i++
