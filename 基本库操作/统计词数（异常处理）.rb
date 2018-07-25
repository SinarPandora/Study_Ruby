# 总行数
ltotal = 0
# 总词数
wtotal = 0
# 总字符数
ctotal = 0
# 通过此变量设置重复一次
can_retry = true

printf("%s %8s %8s %8s\n", "行数", "词数", "字符数", "文件名")
ARGV.each do |file|
  begin
    input = File.open(file)
    # 设置单次行数，词数，字符数临时变量
    l, w, c = 0, 0, 0
    input.each_line do |line|
      l += 1
      c += line.size
      line.sub!(/^\s+/, "")
      ary = line.split(/\s+/)
      w += ary.size
    end
    input.close
    can_retry = true
    printf("%8d %8d %8d %s\n", l, w, c, file)
    ltotal += l
    wtotal += w
    ctotal += c
  rescue => ex
    # 如果文件读取错误，再给一次机会
    if can_retry
      can_retry = false
      retry
    end
    puts ex.message
  ensure
    # 相当于finally
  end
end

printf("%8d %8d %8d\n", ltotal, wtotal, ctotal)
