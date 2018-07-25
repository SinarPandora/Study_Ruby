# 返回匹配的位置
puts /very/ =~ "Ruby is a very programmer-friendly language."
puts /ruby/ =~ "Python"
puts /Ruby/ =~ "ruby"

# 不区分大小写模式
puts /Ruby/i =~ "ruby"

# 简单应用
name = %w(心阳 喵君 啊哈 窗帘 潘心阳)
name.each { |x|
  if /心阳/ =~ x
    p x
  end
}

str = "It's a very long sentence, that include number like 123 and symbol like %^!"
p /[0-9]+/ =~ str