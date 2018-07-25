$var = 0
var = 0

require './变量与常量'

p $var #=> 全局变量会被引入的同名变量覆盖
p var  #=> 局部变量不会
