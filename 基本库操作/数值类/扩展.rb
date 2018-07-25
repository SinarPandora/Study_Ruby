# 操作符
# 其实 Ruby 中的运算符都是方法
# 比如比较运算符，就是 Comparable 模块中封装好的，将其 Mix-in 入类后，就可以实现对实例进行比较的方法
class Mouse
  include Comparable
  attr_accessor :size
  def initialize(size)
      @size = size
  end

  # 只许定义比较方法，就可以自动生成 >, < 这两个方法
  def <=>(other)
    size <=> other.size
  end
end

mouse_a = Mouse.new 12
mouse_b = Mouse.new 24

p mouse_a <=> mouse_b
p mouse_a > mouse_b
p mouse_a < mouse_b