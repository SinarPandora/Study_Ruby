# Ruby 中，称方法调用为 向对象发送信息

# 块调用
name = %w(aha bar foo baz)

name.each do |x|
  puts x
end

# 运算符调用
puts 1 + 2
/ruby/i =~ 'Ruby is wonderful'

# 方法类型
# 实例方法
# 以对象为接收者的方法，是最常用的方法类型
'Hello Ruby!'.empty?
#   对象   <== 方法（信息）

# 类方法
# 接收者不是对象，而是类本身的方法
# 调用类方法时，可以使用::代替.
array = Array.new
File.rename 'simple.txt', 'very_simple.txt'
Time::now
array2 = Array["a", "b", "c"]

# 函数式方法
# 没有接收者的方法，并不代表真的没有接收对象，只是可以省略
# 函数式方法的执行结果不会根据接收者状态而发生变化
# 换句话说，不需要特定接收者的方法既是函数式方法
print 'function'
sleep(10)

# 关于RDoc
# 文档中标记实例方法采用 Array#each
# 标记类方法采用 Array::new
# 或 Array.new
# 符合实际的语法

# 调用的特殊情况
def mix(a, b, c)
  a + b + c
end

# 利用引用，一次传递多个参数
p mix(1, *[2, 3])
args1 = [1, 2, 3]
p mix *args1

# 散列参数
def echo(arg)
  arg
end

# 所有格式均提供支持
p echo({"a" => 1, :b => 2})
p echo({a: 1, b: 2})
p echo(a: 1, b: 2)
# 如果最后一个参数为散列，这样输入也是可以的