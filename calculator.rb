puts "入力してください"

# 通常の電気代 0.2円/分
NOMAL_ELECTRIC_BILL = 0.2
# 暖気運転時、4倍の金額がかかる
WARM_UP_POWER = 4
# 入力値を受け取る
input_time = gets.split
# 設定温度に到達するまでの時間
preset_tempreature = input_time.first.to_i

# エアコンの総稼働時間
arr_time = input_time.drop(1)
total_time = arr_time.map(&:to_i)

# つけっ放しの場合にかかる電気代
before_warm_up = preset_tempreature * NOMAL_ELECTRIC_BILL * WARM_UP_POWER
after_warm_up = ( total_time.sum - preset_tempreature ) * NOMAL_ELECTRIC_BILL
not_change = before_warm_up + after_warm_up

# ONの総稼働時間
on_time = total_time.each_slice(2).map(&:first).map(&:to_i)
# on off した電気代
change = 0
on_time.each do |time|
  after_warm_up = ( time - preset_tempreature ) * NOMAL_ELECTRIC_BILL
  change += before_warm_up + after_warm_up
end

if not_change > change
  puts "節約になった！"
  puts "つけっ放しの金額"
  puts "#{not_change}円"
  puts "on off した金額"
  puts "#{change}円"
else
  puts "損した・・・"
  puts "つけっ放しの金額"
  puts "#{not_change}円"
  puts "on off した金額"
  puts "#{change}円"
end
