# 块是调用方法时能与参数一起传递的多个处理的集合

a = [1, 2, 3, 4]
a.each_with_index do |obj, idx|
  puts "#{idx} => #{obj}"
end
# 实现了循环处理的方法称为迭代器（iterator）
b = {参与者: "张三", 费用: 100}
b.each {|item| puts "#{item[0]} => #{item[1]}"}
# each 相当于从集合中取出每个元素，而块变量就是接收取出值的变量，所以相应的解包赋值语句也有效

b.each do |key, value|
  puts "#{key} => #{value}"
end
# 还有其他种类的 each，比如 each_line

# 块的一种用法如下
# 第一个块变量 file 接收前面语句的返回值
File.open("异常处理.rb") do |file|
  sum = 0
  file.each_line do |line|
    sum += 1
  end
  puts "共有 #{sum} 行"
end
# 执行完后会自动执行 file.close
# (该种块必须事先被定义，并不是通用写法)

# 块的另一种用法：替换算法
# Array#sort 默认使用纯 <=> 运算
# 可以通过代码块定义新的排序模式

# a <=> b ：
# a > b #=> 1
# a < b #=> -1
# a == b #=> 0
# 只要编写出相同返回值的代码块即可达到相同效果

array = %w(ruby python php java)

# 原始方法
p array.sort {|x, y| x <=> y}
# 用长度排序
p array.sort {|x, y| x.length <=> y.length}
# 但是这样会成倍调用 length 方法，使程序效率变低
# 故可以使用 sort_by 代码块代替(几个元素就调用几次)
# 带叹号的方法一般会直接修改源数据而不是生成副本
array.sort_by! {|item| item.length}
p array