# 创建实例
string = String.new

# 查看所属类
p 'str'.class               #=> String
p 'str'.is_a? String        #=> true
p 'str'.instance_of? String #=> true

# 甚至可以查看父类
p 'str'.class.superclass