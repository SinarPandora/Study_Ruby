# 注意，只有 nil 和 false 视为假
# 不过 nil 并不等于 false

p nil == false

# 我们约定，返回真假值的方法，结尾使用 ? 标记
def more_than_10?(x)
  x > 10
end

print more_than_10? 20

# 使用与 C 一样的逻辑运算符
if 1 < 2 && 2 < 3
  p 'Yes'
end

a = 12
if a != 11
  p "yes"
end
# 可以用 unless 替换循环中 if not 的条件，
# 某些情况下可以增加可读性
# 其他与 if 相同
unless a == 11
  p "yes"
end

b = [1, 2, 3]
case b
when 1, 2, 3, 4, 5
  p "幼年"
when 6..18
  p "少年"
when 18..24
  p "青年"
when Array
  p "请输入单个数值"
# 这里的正则只是个例子
when /%w+/
  p "请输入合法数值"
else
  p "其他年龄段"
end

# === 可以判断：
# 数值相等
# 是否是某一类的实例
# 是否匹配正则表达式
# when 使用的是 ===
