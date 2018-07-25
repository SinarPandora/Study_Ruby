=begin
Numeric => Integer => Fixnum
                   => Bignum
        => Float
        => Rational（有理数）
        => Complex （复数）

Integer 类分为两类
可由计算机处理的 Fixnum类
比 Fixnum 更大的 Bignum类

Ruby 会对数值类进行自动扩展
Rational类采用分子分母的方法定义
Complex类采用实部虚部的方法定义
=end

a = Rational(1, 3)
p a #=> 1/3
b = Complex(1, 3)
p b #=> 1+3i
p [b.real, b.imaginary]

=begin
| 字面量             | 作用            |
| ----------------- | --------------- |
| 123 \ 0d123      | 十进制数        |
| 0123 \ 0o123     | 八进制数        |
| 0x123             | 十六进制数      |
| 0b1111011         | 二进制数        |
| 123.45            | 浮点小数        |
| 1.23e4 \ 1.23e-4 | 科学计数法      |
| 123r              | 有理数（123/1） |
| 123i \ 123.45i   | 虚部            |
=end

# 可以用下划线表示位数，下划线会自动忽略
p 12_345_678
p 123i.is_a? Complex

# Ruby 与 C 相同，用小数点代表非整除
p 5 / 2
p 5 / 2.0

# 除成分数形式
p 5.quo 2 #=> （5/2）

# 返回一个结果和余数的数组
p 5.divmod 2

# 余数
p 5 % 2
p 5.modulo 2

# 返回余数，正负符号与调用者相同
p 5.remainder 2

# 查看 Math模块全部自带方法
# require 'pp'
# pp Math.methods

# PI
p Math::PI

# E
p Math::E

# 转换
p 2.5.to_i
p "2.5".to_f
# 支持转换为各种进制以及虚数，有理数（分子分母）
p 1.5.to_r
p 4.to_i
p 12.to_bn

# 四舍五入
p 0.12.round # 参数为位数，默认取整（0）
p 0.12.round 1
p 0.15.round 1
# 默认从右往左算位数（数学思维）
# 负数可以设置为从左往右算
p 120.round -2 #=> 100
p 180.round -2 #=> 200

# 取整
# 返回比接收者大的最小整数
p 1.5.ceil  #=>  2
p -1.5.ceil #=> -1
# 返回比接收者小的最大整数
p 1.5.floor  #=>  1
p -1.5.floor #=> -2
