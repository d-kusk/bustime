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

      filterTimeTable(timeTables, destVal)

      # 時刻表エリアのクリア
      busTimeLists.textContent = null
      # 時刻表の表示
      _j = 0
      while(_j < busTime.times.length)
        _listTemp = document.createElement('li')
        _listTemp.innerHTML = busTime.hour + ':' + busTime.times[_j]
        busTimeLists.appendChild(_listTemp)

        _j++
  _i++
