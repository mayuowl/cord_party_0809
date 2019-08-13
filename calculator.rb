puts "input waiting..."
input = gets # 標準入力を受け付ける
result = input.chomp == 'answer' # inputには改行文字が含まれているためchompしています
puts result
puts "入力してください"

# 通常の電気代 0.2円/分
NOMAL_ELECTRIC_BILL = 0.2
# 暖気運転時、4倍の金額がかかる
WARM_UP_POWER = 4
# 入力値を受け取る
input_time = gets.split
# 設定温度に到達するまでの時間
PRESET_TEMPERATURE = input_time.first.to_i

# エアコンの総稼働時間
arr_time = input_time.drop(1)
total_time = arr_time.map(&:to_i)

# つけっ放しの場合にかかる電気代
before_warm_up = PRESET_TEMPERATURE * NOMAL_ELECTRIC_BILL * WARM_UP_POWER
after_warm_up = ( total_time.sum - PRESET_TEMPERATURE ) * NOMAL_ELECTRIC_BILL
not_change = before_warm_up + after_warm_up

# ONの総稼働時間
on_time = total_time.each_slice(2).map(&:first).map(&:to_i)
# on off した電気代
change = 0
on_time.each do |time|
  after_warm_up = ( time - PRESET_TEMPERATURE ) * NOMAL_ELECTRIC_BILL
  change += before_warm_up + after_warm_up
end

if not_change > change
  puts "節約になった！"
  puts "つけっ放しの金額"
  p not_change
  puts "on off した金額"
  p change
else
  puts "損した・・・"
  puts "つけっ放しの金額"
  p not_change
  puts "on off した金額"
  p change
end
