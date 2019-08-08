puts "input waiting..."
input = gets # 標準入力を受け付ける
result = input.chomp == 'answer' # inputには改行文字が含まれているためchompしています
puts result
