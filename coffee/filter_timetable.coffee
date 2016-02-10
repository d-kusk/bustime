# 行き先を元に時刻表のデータを絞り込む処理
filterTimeTable = (timeTables, dest) ->
  window.busTime =
    dest: '',
    timeTable: {},
    hour: 0,
    times: []

  # 目的地に合わせて時刻表を抜き出す
  if (dest == 'osu')
    # 大阪産業大学行きの時刻業
    busTime.dest = '大阪産業大学'
    busTime.timeTable = timeTables.timeTableToOSU
  else if (dest == 'sta')
    # 住道駅行きの時刻表
    busTime.dest = '住道駅'
    busTime.timeTable = timeTables.timeTableToSta
  else
    console.log 'Error: 行き先から不正に値を取得しました。'

  # 現在時間を元に絞り込む
  d = new Date()
  hour = d.getHours()
  minute = d.getMinutes()

  busTime.hour = hour
  allTimes = busTime.timeTable[Number(hour)]

  # 現在の時間帯のバスの出発時刻一覧から
  i = 0
  while (i < allTimes.length)
    if (minute < allTimes[i])
      busTime.times.push(allTimes[i])
    i++
