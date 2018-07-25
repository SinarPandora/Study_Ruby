# 模块 (Mix-in) 类似于接口，但是是具有实际意义的数据，行为的集合
# 模块不能拥有实例
# 模块不能被继承

# 具有相同功能，但是不是同一种类的情况
# 需要添加共通功能时

module MyModule
  VERSION = 1.0
  def talk(something)
    puts something
  end

  def move
    puts "I'm moving."
  end

  # 如要将模块内方法作为函数公开给外部使用
  # 需要使用 module_function 修饰符
  # 并在包含时视为私有实例方法
  module_function :move
end

class Man
  # 当类 Mix-in 了模块，相当于给类添加了实例方法
  # 此时的 self 指代被 Mix-in 的类的对象
  # 所以即使是相同的函数，在上下文不同时，所产生的效果也有可能不同
  # 故，不建议在 module 中使用 self
  include MyModule
  def think
    puts "I can think!"
  end
end

class Parrot
  include MyModule
  def fly
    puts "I can fly!"
  end
end


man = Man.new
parrot = Parrot.new

# 判断该类是否加载了模块
p Man.include? MyModule

man.talk "我是人"
parrot.talk "我是鹦鹉"
man.think
parrot.fly

# 模块同样可以包含常量
p MyModule::VERSION

# 公开方法可以仅通过模块名访问
MyModule.move
# man.move #=> NoMethodError
# 非公开方法则不能直接访问
# MyModule.talk("张三")

# 查看该类的继承关系（获得该类的继承关系列表）
p Man.ancestors #=> [Man, MyModule, Object, Kernel, BasicObject]
# 可以看出，引用模块也算作是继承
# 而 superclass 方法则直接返回父类
p Man.superclass


# 命名空间
# 不同命名空间下的同名变量/方法被视为不同变量

include Math
p Math::PI
p Math.sqrt 4