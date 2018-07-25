# 使用继承的几种情况
# 1.在不影响原功能的情况下追加功能
# 2.重新定义原有功能没事名称相同的方法产生不同的效果
# 3.在已有功能基础上追加处理，扩展已有功能
#
# Ruby 中，最底层的类是 BasicObject，比 Object 底层，具有极少方法
#
# 继承关系，又称 is-a 关系

# 创建类
class HelloWorld
  # 存取器简写形式（相当于实现了那两个方法）
  attr_accessor :name


  # 大写字母开头的为常量（参见变量与常量.rb），
  # 仅开头即可，为了更明显，常全部大写
  # 但只有类本身能访问，实例并**不能访问**
  VERSION = 1.0

  # 类变量
  # 该类全部实例的共享变量
  # 不过并不推荐使用（bad style）
  @@counter = 0

  def counter
    @@counter
  end

  # 初始化方法
  def initialize(name = "Ruby")
    # 实例变量
    # 默认私有
    @name = name
    @@counter += 1
  end

  # 实例方法
  # 新建的方法会取代旧的方法而不会作为新方法
  def hello
    puts "Hello, world! I'm #{@name}."
  end

  def show_my_name
    # self 指代实例本身
    puts self.name
    # 实例方法的第一个参数（隐藏）默认为 self，
    # 也就是说即使不写 self 也可以引用内部成员
    puts name
  end
  # # 存取器方法
  # # getter
  # def name
  #   @name
  # end
  # # setter
  # def name=(value)
  #   @name = value
  # end

end

alice = HelloWorld.new 'Alice'
ruby = HelloWorld.new

alice.hello
ruby.hello
ruby.name = 'Matz'
ruby.hello
puts ruby.counter
# puts ruby.VERSION

# 拿取常量
puts HelloWorld::VERSION

# 单例类定义，只对单例有效
class << HelloWorld
  # 添加**单例方法**
  def hello(name)
    puts "#{name}, say 'Hello'."
  end

  # 引用该类本身，并添加**单例方法**
  class << self
    def hello(name, age)
      puts "#{name}, say 'Hello', and is #{age} years old."
    end
  end

  # 添加单例方法的另一种方式
  def self.hello_again(name)
    puts "#{name}, say 'hello' again"
  end
end

# 在外部添加单例方法
def HelloWorld.hello_too(name)
  puts "#{name} say 'hello', too"
end

# 通过类名本身可以使用单例方法，但不能直接使用实例方法（区别）
# 也就是说单例方法不会让新实例使用
HelloWorld.hello("Aha")
# 通过 New 创建的新实例并不拥有单例方法
bob = HelloWorld.new
# bob.hello_again("bob")

# 向类添加实例方法，执行到此，全局的该类实例（包括已存在的）都添加了此方法
class HelloWorld
  def hello_and_smile(name)
    puts "#{name} say 'hello', and smile."
  end

  # 给方法起别名（同样是执行到此才会生效）
  # 经常用于处理子类的同名新方法
  # alias 别名 原名（符号可以省略
  alias :hello_then_smile :hello_and_smile
  alias hello2 hello
  # 因为同名方法只有一份，不需要考虑到底是哪个方法被改名了

  # 删除方法定义
  # 三种写法均可
  # undef_method("show_my_name")
  # undef :show_my_name
  undef show_my_name

end

ruby.hello_then_smile('ruby')
ruby.hello2
bob.hello_then_smile('bob')
