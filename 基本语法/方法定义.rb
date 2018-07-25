def hello
  puts 'hello'
end

hello

# 支持默认值

def hello_with_default(name='Ruby')
  puts "Hello, #{name}!"
end

hello_with_default
hello_with_default('ruby')

# 如果最后一行就是返回值，那么 return 可以省略

def max(a, b)
  if a > b
    a
  else
    b
  end
end

# return 用来强行结束程序（单个 return 返回值为 nil）
# 或处理一些特殊情况

# 可以使用键值对定义函数参数，在调用时会强制使用键值对形式输入
# 同时支持默认值
def area(x:, y:, z:0)
  (x * y + y * z + x * z) * 2
end

area(x: 1, y: 2, z: 3)

# 不定参数的两种形式：
# *args  不定参数列表
# **args 不定参数散列表
