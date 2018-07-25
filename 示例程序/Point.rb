class Point
  attr_accessor :x, :y

  def initialize(x=0.0, y=0.0)
    @x, @y = x, y
  end

  # 重新定义 p
  def inspect
    "<Point Object (#{x},#{y})>"
  end

  # 重新定义一元运算符 +
  def +@
    # 返回自己的副本
    dup
  end

  # 重新定义一元运算符 -
  def -@
    self.class.new(-x, -y)
  end

  # 重新定义一元运算符 ！
  def !
    self.class.new(-y, -x)
  end

  # 重新定义一元运算符 ~
  # 旋转 90°
  def ~@
    self.class.new(-y, x)
  end

  # 重新定义二元运算符 +
  def +(other)
    self.class.new(x + other.x, y + other.y)
    # 其实直接用 Point.new() 也能解决问题，但缺点在于不能灵活的处理被继承或当作模块的情况
  end

  # 重新定义二元运算符 -
  def -(other)
    self.class.new(x - other.x, y - other.y)
  end

  # 交换坐标值
  def swap(other)
    tmp_x, tmp_y = @x, @y
    @x, @y = other.x, other.y
    other.x, other.y = tmp_x, tmp_y
    self
  end

  def to_s
    "(#{x}, #{y})"
  end

  # 重新定义[]
  def [](index)
    case index
    when 0
      x
    when 1
      y
    else
      # 如果越界，抛出自定义异常
      raise "没有此参数"
    end
  end
end

p0 = Point.new(3.0, 1.0)
p1 = Point.new(6.0, 2.0)
p0.swap(p1)
puts p0.x, p0.y
puts p1.x, p1.y
p3 = p1 - p0
p p3
puts ~p3
puts -p3
puts !p3
# puts p3[3]