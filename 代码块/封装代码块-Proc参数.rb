# 代码块封装为对象，需要用到 Proc.new 这个带块方法
hello = Proc.new do |name|
  puts "Hello, I'm #{name}."
end

# 通过 call 方法调用
hello.call("Ruby")

# 可将 Proc 对象传递给另一个方法
# 如果一般的方法，最后的参数使用 &+参数名 的形式，Ruby 就会自动调用方法将传进来的块封装为对象
# 类似于 yield
# &+参数名 这样的参数成为 Proc参数
# Proc参数必须放在最后一位
# Proc参数可以赋值给变量，给其他方法调用

def total2(from, to, &block)
  result = 0
  from.upto(to) do |num|
    if block
      result += block.call(num)
    else
      result += num
    end
  end
  result
end

p total2(1, 10)
p total2(1, 10) {|num| num ** 2}


# 演示把 Proc变量传给其他方法
def call_each(ary, &block)
  ary.each(&block)
end
#               参数1↓     参数2↓
call_each [1, 2, 3] do |item|
    p item
end