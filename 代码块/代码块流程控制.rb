def total(from, to)
  result = 0
  # upto 方法将整数值按照从小到大的方式取出
  from.upto(to) do |num|
    # 判断变量是否由块赋予
    if block_given?
      # result += 从外部传来的num
      result += yield(num)
    else
      # result += 自身的num
      result += num
    end
  end
  result
end

n = total(1, 10) do |num|
  if num == 5
    break
  end
  num
end

p n #=> 代码块调用 break 成功时，会自动返回到调用代码块之前的状态，
    # 此时代码块定义中设置好的的返回值并没有执行
    # 故代码块的值为 nil

# 可以给 break，next等操作符设置返回值，避免尴尬
n = total(1, 10) do |num|
  if num == 5
    # 给 break 设置返回值
    break 0
  end
  num
end

p n