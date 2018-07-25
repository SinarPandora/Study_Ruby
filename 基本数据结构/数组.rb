# [] 与 %w 均表示数组
name = %w(心阳 喵君 潘多拉)

p name[0]
name[0] = '潘心阳'

# 数组长度
p name.size

# 数组循环
name.each do |x|
  p x
end

# 支持不等长的序列解包
a, b = name
p a
p b