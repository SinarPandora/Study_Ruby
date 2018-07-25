# times 循环
3.times {|x|
  # 从 0 开始
  puts "第#{x}次循环"
}

# for 循环，适合于知道循环次数的情况
sum = 0
for i in 1..5
  sum += i
end
puts sum
# 循环内部变量会保存到外部
puts i

# while 条件循环，适合不满足某一条件退出的情况
# 如果满足，则循环
i = 0
sum = 0
while sum < 50
  sum += i
  i += 1
end
puts sum

# until 条件循环，while 循环的条件反转
# 如果满足，则退出
# 为了某些情况更加直观
i = 0
sum = 0
until sum > 50
  sum += i
  i += 1
end
puts sum

# each 循环
# 适合取出元素，或对元素逐个操作
name = %w(aha foo bar baz)
name.each do |x|
  puts x
end

sum = 0
(1..5).each {
  sum += i
}
puts sum

# 无限循环 loop

loop do
  puts 'ruby'
  # 死循环一定要有明确的退出条件
  sum += 1
  if sum > 20
    break
  else
    # next 视为 continue
    next
  end
end

# 跨行使用 do end，一行使用 {}

(1..3).each {|x| p x}