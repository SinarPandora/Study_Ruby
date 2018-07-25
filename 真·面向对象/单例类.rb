str1 = 'Ruby'
str2 = 'Python'

# 单例类，只对当前单例添加方法
class << str1
  # 仅对该实例添加方法
  def hello
    "hello, #{self}"
  end
end

puts str1.hello #=> hello, Ruby
puts str2.hello #=> NoSuchMethodError
