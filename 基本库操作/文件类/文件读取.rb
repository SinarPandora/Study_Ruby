=begin
# 读取文件全部内容
filename = ARGV[0]
file = File.open filename
text = file.read
# 可以简写为 text = File.read filename
puts text
file.close
# puts File.read(ARGV[0])
=end


# 正常情况下往往是一行一行读取
file_name = ARGV[0]
file = File.open file_name
file.each_line do |line|
  # 能读取到换行符，所以用不输出换行符的 print 函数就能胜任
  print line
end
file.close

