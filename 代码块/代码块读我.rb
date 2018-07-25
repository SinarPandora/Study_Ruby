# 代码块，为了区分代码块内外部，我将代码块各部分起名为：

def total(from, to)
  # ---代码定义---
  result = 0
  from.upto(to) do |num|
    if block_given?
      result += yield(num)
    else
      result += num
    end
  end
  result
  #--------------
end

p total(1, 10) do |x|
  # ---代码块内容---
  x ** 2
  # --------------
end
