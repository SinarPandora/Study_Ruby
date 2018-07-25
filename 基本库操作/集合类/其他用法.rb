# 用数组表示矩阵
a = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]
# 不要用这种方法创建矩阵：
b = Array.new(3, [0, 0, 0])
# 这样创建一个元素均为同一个 [0, 0, 0] 的一维数组
a = [1, 2, 3]
b = %w(a b c)
c = %w(d e f)
p a.zip b, c
p a.all? {|i| i.is_a? Fixnum}
p a.count {|i| i > 0}
a.cycle(2) {|i| puts i}

d = %w(aha 123-456 喵 \(>^ω^<\))
p d.grep(/喵/)
p d.inject {|a, b| "#{a} => #{b}"}
e = %w(1 2 3 4 5 6 7)
