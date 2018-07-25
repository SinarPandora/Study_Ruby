# 当错误触发时，会有两个变量被自动赋值：
# $! :最后一次发生的异常（对象）
# $@ :最后一次发生异常的位置信息
# 异常对象具有方法：
# class 异常种类
# message 异常信息
# backtrace 异常发生的位置信息（$@与此等价）

# rescue 有对应的修饰符，如下：

# 如果出错，就赋值为后面的值
a = Integer("abc") rescue 0

# 可以将该错误赋值到变量里，使用如下方法
# rescue => ex (用于多个错误对象的分别捕获)
begin
rescue NoMethodError, NameError => e1
  e1
rescue TimeoutError => e2
  e2
end

# 可以在方法调用时使用
def foo
rescue
  puts "方法调用失败"
ensure
  # 一些处理
end

# 也可以在类创建时使用
# 但类创建不成功会直接引发后面的错误，所以一般不这么使用
class Foo
rescue
  puts "类创建失败"
ensure
# 一些处理
end

# 错误捕获顺序：
# 不指定类名时一般捕获 StandardError 类及其子类的异常
# 所以自定义异常类一般先继承 StandardError

# 抛出异常
# raise 异常类 信息（均可省略），全部省略会默认抛出 RuntimeError，在 rescue 中会默认抛出最后一次发生的异常 $!

raise "一个错误"