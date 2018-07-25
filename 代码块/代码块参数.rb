def total(from, to)
  result = 0
  # upto 方法将整数值按照从小到大的方式取出
  from.upto(to) do |num|
    # 判断变量是否由块赋予
    if block_given?
      # result += 从外部传来的num
      result += yield(num)
    else
      # result += 自身的num
      result += num
    end
  end
  result
end

p total 1, 10
p total(1, 10) {|x| x ** 2}

# 关于参数数量
def block_args_test
  yield()
  yield(1)
  yield(1, 2, 3)
end

# yield 的参数个数与块变量的个数是不一样的
puts "通过|a|接收块变量"
block_args_test do |a| #=> [nil]      多出一个块变量，被赋值为 nil
  p [a]                #=> [1]        一个块变量也不多，被赋值为 yield 参数1
end                    #=> [1]        缺少两个块变量，缺少的部分被忽略
puts "通过|a, b, c|接收块变量"
block_args_test do |a, b, c| #=> [nil, nil, nil]    多出三个块变量，被赋值为 nil
  p [a, b, c]                #=> [1, nil, nil]      多出两个块变量，被赋值为 nil
end                          #=> [1, 2, 3]          一个块变量也不多，接收全部 yield 参数
# 块变量比较多时，多出来的块变量值为 nil
puts "通过|*a|接收块变量"
# 用引用接收（相当于方法定义中的
# 接收全部 yield 参数
block_args_test do |*a| #=> [[]]            yield 参数为空
  p [a]                 #=> [[1]]           yield 参数为1
end                     #=> [[1, 2, 3]]     yield 参数为1， 2， 3

# 由此可见
# 0.yield 是将代码块里内容以类似方法的形式传入代码块定义内的操作符
# 1.当 yield(n) 的参数 n 来自代码块时，会获取代码块块变量进行计算
# 2.当 yield(n) 的参数 n 来自代码块定义时，会将值作为参数赋值给代码块变量
# 3.可以使用引用 *a 接收全部的 yield(n) 参数 n
# block_args_test {|块变量|
#   # 操作} yield 将大括号部分作为方法传入块内部
# end
# （详情见图）
