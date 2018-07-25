a = 1
a += 1
puts a
# 此时的 a 进行了 get 和 set 两次操作，所以必须实现 get set 方法

# ruby 中，只有 nil 和 false 视为假
# 并且 nil 不等于 false
# 其他如空字符串，0等均视为真

b = 2 if a > 1
c = nil # 值得注意的是，变量不存在不视作空
# 如果 c 存在则赋值为 c，否则赋值为 2
b = c || 2
ary = [0, 1, 2]
# 如果数组不为空，就把第一个元素赋值给 c
c = ary && ary.first
# 简写为：(require ruby 2.3 &later)
# &. 称为安全运算符
c = ary&.first

# ? 称为条件运算符，前面的为条件，如果满足，该算式值为 a，否则为 b
max = (a > b)? a: b

# .. 范围运算符，闭区间
(1..10).each {|x| print x, " "}
# ... 范围运算符，左闭右开区间
(1...10).each {|x| print x, " "}
# 甚至支持字符
("a".."z").each {|x| puts x}
# 实际上调用了 succ 方法
puts 'a'.succ #=> 'b'

# 大部分运算符可以重定义，但下面这几种不可以
# :: & || .. ... ?: not = and or
