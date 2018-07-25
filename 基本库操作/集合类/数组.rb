# 创建数组的方法
a = [1, 2, '3']
# 第一个参数代表数组元素个数
# 第二个参数代表默认元素值 (不指定则视为 nil)
b = Array.new(5)
p b #=> [nil, nil, nil, nil, nil]
b = Array.new(5, 0)
p b #=> [0, 0, 0, 0, 0]

# 如果数组元素类型相同，可以使用如下方法创建数组
# 数组类型全为字符串
c = %w(Ruby Python Perl Scheme Pike)
# # 数组类型全为符号
d = %i(:Ruby :Python :Perl :Scheme :Pike)
# 其中，括号可以被任意重复（ASCII）字符如：
# <>, ||, !!, @@, %%等代替
e = %w~Ruby Python Perl Scheme Pike~
p e

# 转换为数组
# to_a
f = {black: '#000', white: '#FFF'}
p f.to_a

# 切片操作（下标从0开始）
# 从 n 取到 m（闭区间）
g = c[1..3]
p g
g = c[1...3] #=> 几个点都是一样的
p g
# 从 n 开始，一共取 m 个
g = c[1, 4]
p g
g = c[-3..-1]
p g
g[1] = "aha"
p g
p c
# 能看出，取出的不是引用，而是复制了一份真实值

# 同样，有方法表示形式
g = c.at 2
p g
g = c.slice 2
p g
g = c.slice 1 .. 3
p g
g = c.slice 1, 3
p g

# 替换多组元素
c[2..4] = %w(Go NodeJs Haskell)
p c

# 插入元素
c[2, 0] = %w(Lisp Scala)
p c

# 跳跃拿取元素创建数组（可以重复）
g = c.values_at(0, 1, 3, 5, 3)
p g

# + 在原来基础上创建新的数组（对原来的数组无影响）
# concat 会在追加的同时破坏原来数组
alpha = %w(a b c d e f g)
p alpha + %w(i j)
p alpha
alpha.concat %w(k l)
p alpha

# 使用破坏性方法 eg： concat pop shift 时需要格外小心
# 可以使用 Object#freeze 将对象内容冻结
# 此时调用相关破坏性方法会抛出异常
# 冻结的对象无法解冻，但可以通过 dup 方法（意为：第二份）获取该冻结对象的副本（非冻结）

alpha.freeze
p alpha.dup.concat %W(a)

# 在 Ruby 中，破坏性方法一般约定俗成的在末尾添加 !


