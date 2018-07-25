# 继承并修改内置方法
class RingArray < Array
  def [](i)
    # 求出索引（因为该列表是环状的）
    idx = i % size
    super(idx)
  end
end

wday = RingArray['周一', '周二', '周三', '周四', '周五', '周六', '周日']

puts wday[-1] #=> 周日
puts wday[22] #=> 周二

# 默认新声明的类继承自 Object，但 Object 有许多内置方法，有些情况下我们不需要那么多的方法，就可以继承 BasicObject 这个类（Ruby 的最基础类）
# 列出 Object 内置的方法
puts Object.instance_methods
puts '-' * 20
# 列出 BasicObject 内置的方法
puts BasicObject.instance_methods
