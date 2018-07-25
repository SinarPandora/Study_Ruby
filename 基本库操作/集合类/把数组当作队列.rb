# 队列是一种先进先出（FIFO）的数据结构，因此又称为等待队列
# 栈是一种后进先出（LIFO）的数据结构，所以适合嵌套函数的求解
=begin
|      | 对数组开头元素的操作 | 对数组末尾元素的操作|
| ---- | ----------------- | ---------------- |
| 追加 | unshift           | push             |
| 删除 | shift（删除 + 获取）| pop（删除 + 获取）|
| 引用 | first （单纯获取）  | last（单纯获取）  |
#
# Ruby 在对数组操作时，如果只采用如上方法就可以是作为队列/栈（Duck-Typing）
=end
alpha = %w(a b c d e f g)
p alpha.shift
p alpha.unshift "a"

p alpha.first

# << 与 push 等价
alpha << "h"
p alpha

