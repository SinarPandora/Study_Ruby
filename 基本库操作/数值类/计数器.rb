n = 3

# 循环 n 次，从 0 到 n - 1 赋值给 i
n.times do |i|
  puts i
end

# 从 n 开始，直到10，每次赋值给 i 并增加1
# 如果参数小于 n，则不会执行
n.upto 10 do |i|
  puts i #=> 3, 4, 5, 6, 7, 8, 9, 10
end

# 跟上一个相反，从 n 开始，直到0，每次赋值给 i 并减少1
n.downto 0 do |i|
  puts i #=> 3， 2， 1， 0
end

# 指定步长的计数
# 参数为要达到的数，步长
n.step 10, 2 do |i|
  puts i #=> 3， 5， 7， 9
end

# 如果不对以上几个方法指定代码块，就会返回可迭代类型对象 Enumerator
# 可以通过 Enumerator#collect 获取
ary = 2.step(10).collect {|i| i * 2}
p ary