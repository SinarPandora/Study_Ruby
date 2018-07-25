module MyModule
  def talk(something)
    puts something
  end

  def move
    puts "I'm moving."
  end

  module_function :move
end

module MyModule2
  def bark(something)
    puts something << "!!"
  end

  def walking
    puts "I'm walking."
  end

  module_function :walking
end



class Cat

end

cat = Cat.new
# 用模块的方式批量导入单例方法 （extend） 关键字
cat.extend MyModule
# 模块函数会作为单例方法导入
cat.talk "猫"
# 公开函数不会被导入
# cat.move

class Dog
  # include 将模块内方法当作实例方法导入到类中
  # 只有实例才能引用
  include MyModule
  # extend 将模块内方法当做类方法导入到类中
  # 只有类本身才能使用
  extend MyModule2
  # 而标记为 module_function 的方法仅作为模块方法使用（只能通过模块名.方法名直接引用）
  # 对导入或包含的类视为私有方法
  def move
    MyModule.move
  end
end

Dog.new.talk "狗"
Dog.new.move
Dog.bark "汪"
# Dog.walking #=> 报错