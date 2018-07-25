list = %w(a b c d e f g)
# 一般迭代
list.each {|i| puts i}
# 带下标迭代
list.each_with_index {|val, idx| puts "#{idx} => #{val}"}
# 破坏性迭代
while (item = list.shift)
  puts item
end
if list.length == 0
  puts "数组中元素已经空了"
end
# 迭代器是代码块的基本用途之一，可以方便的用代码块制作自己的迭代器