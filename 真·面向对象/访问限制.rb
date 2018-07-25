class AccTest
  def pub
    puts 'pub is a public method.'
  end

  # 访问控制要放在方法定义后面
  public :pub # 公有方法可以省略声明（方法默认公有）

  def priv
    puts 'prive is a private method.'
  end

  private :priv # 不可省略
end

acc = AccTest.new
# 正常访问
acc.pub
# 无法访问
# acc.priv  #=> NoMethodError

# 可以临时修改访问限制
class AccTest
  # private to public
  public :priv
end
acc.priv

# 希望统一定义方法访问级别时，可以使用下面语法批量控制
class AccTestPro
  # 以实例方法的形式向外部公开该方法
  public

  def pub
    puts 'this is a public method.'
  end

  # 实例不能访问该方法
  private

  def priv
    puts 'this is a private method.'
  end

  # 同一个类及子类（实例不算）可访问
  protected

  def pro
    puts 'this is a protected method.'
  end


  # 可以多次使用

  public

  def pub2
    puts 'this also a public method'
  end
end

# 未指定公有私有时，方法默认公有，但 initialize 方法默认为私有