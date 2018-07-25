require 'pp'
# 关于符号（可视为轻量字符串）
# 属于 Symbol 类
# 符号作为名称标签使用，表示方法等对象的名称
# 作为判断对象时，比字符串效率更高
foo = :echo # 等价 foo = ':foo'
bar = :bar

p foo.is_a? String
p foo.is_a? Symbol
p foo.to_s.is_a? String

p foo
p foo.to_s

if foo == bar
  p TRUE
end

# 散列创建

# 符号键
song = {
    :title => 'BOY',
    :artist => 'uchuu;'
}

# 符号键（简写）
address = {
    name: '心阳',
    pinyin: 'xin yang',
    postal: '10001'
}

# 数值键
mark = {
    11 => 'to day',
    13 => 'deadline'
}

# 字符串键
weather = {
    "type": "下雨",
    "temp": "12°C"
}

# 散列循环

address.each {|key, value|
  p "#{key} => #{value}"
}

pp mark