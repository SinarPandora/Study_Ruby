beta = [1, nil, nil, 2, 4, 5, 6, 1, 0, 'aha']

# 删除系：
# 删除空元素（nil）
p beta.compact
p beta.compact! # 删除空元素（破坏性）
# 删除指定元素
beta.delete 'aha'
# 删除指定位置的元素
beta.delete_at 2
# 删除满足条件的元素
beta.reject {|x| x < 2}
beta.delete_if {|x| x < 2} # 破坏性
beta.reject! {|x| x < 2} # 破坏性
# 拿出然后删除数组中某部分元素（切片操作的破坏性模式）
beta.slice! 1
beta.slice! 1..2
beta.slice! 2, 3
# 删除重复元素
beta.uniq
beta.uniq! # 破坏性
# 取出并删除数组头元素（破坏性）
beta.shift
# 取出并删除数组尾元素（破坏性）
beta.pop

# 替换系：
# 将每个元素处理
beta.collect {|x| x * 2}
beta.collect! {|x| x * 2} # 破坏性
beta.map {|x| x * 2} # 等价于 collect
beta.map! {|x| x * 2} # 破坏性
# 元素覆写（破坏性）
beta.fill(1) # 全部覆写
beta.fill(1, 2) # 从第二个元素开始覆写
beta.fill(1, 2, 3) # 从第二个元素开始，覆写三次
beta.fill(1, 2..4) # 从第二个元素开始，覆写直到到第四个元素
# 嵌套展开
# 把所有嵌套打开，合成一个大数组
gamma = [[1], "aha", [1, 2, 3, 4]]
p gamma.flatten #=> [1, "aha", 1, 2, 3, 4]
gamma.flatten!  # 破坏性
# 反转
gamma.reverse
gamma.reverse! # 破坏性
# 排序
gamma.sort
gamma.sort! # 破坏性
gamma.sort {|a, b| a.to_s.length <=> b.to_s.length}
gamma.sort! {|a, b| a.to_s.length <=> b.to_s.length} # 破坏性
gamma.sort_by {|i| -i}

# 以上是常见方法