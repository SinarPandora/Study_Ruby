# 基本块定义
def my_loop
  loop do
    yield
  end
end

num = 1
my_loop do
  p "num is #{num}"
  break if num > 10
  num *= 2
end

# 详见 /代码块/代码块