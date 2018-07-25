# 默认返回一个比1小的浮点小数
p Random.rand
# 参数为正整数时，返回0 ~ 该正整数 之间的整数（左闭右开）
p Random.rand 100
# 程序并不能能真的生成随机数，只是通过算法计算出来的
# 这种随机数称之为伪随机数
#
# 生成伪随机数需要以某个值为基础，称之为随机数的种子
# 只要随机数种子一样，得到的随机数值就有可能重复
# 举例如下：
r1 = Random.new 1
p [r1.rand, r1.rand]
r2 = Random.new 1
p [r2.rand, r2.rand]  #=> 两次生成的随机数，结果相同
r3 = Random.new       #=> 不传入参数的初始化，会使用随机种子
p [r3.rand, r3.rand]  #=> 新的随机数

require 'securerandom'

p SecureRandom.random_bytes(12)  #=> 返回长度为 n 的随机字节
p SecureRandom.base64(12) #=> 返回长度为 n 的随机字符串（英文 + 数字）