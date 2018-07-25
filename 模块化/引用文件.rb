# 从相对路径和全局引用（环境变量）
require 'date'
require '../基本语法/方法定义 '
# 以相对路径引用
require_relative '../基本数据结构/散列'

hello
days = Date.today - Date.new(1993, 2, 24)
p days.to_i
