#
# @lc app=leetcode.cn id=191 lang=python3
#
# [191] 位1的个数
#
# https://leetcode.cn/problems/number-of-1-bits/description/
#
# algorithms
# Easy (76.05%)
# Likes:    502
# Dislikes: 0
# Total Accepted:    276.1K
# Total Submissions: 363.1K
# Testcase Example:  '00000000000000000000000000001011'
#
# 编写一个函数，输入是一个无符号整数（以二进制串的形式），返回其二进制表达式中数字位数为 '1' 的个数（也被称为汉明重量）。
#
#
#
# 提示：
#
#
# 请注意，在某些语言（如
# Java）中，没有无符号整数类型。在这种情况下，输入和输出都将被指定为有符号整数类型，并且不应影响您的实现，因为无论整数是有符号的还是无符号的，其内部的二进制表示形式都是相同的。
# 在 Java 中，编译器使用二进制补码记法来表示有符号整数。因此，在上面的 示例 3 中，输入表示有符号整数 -3。
#
#
#
#
# 示例 1：
#
#
# 输入：00000000000000000000000000001011
# 输出：3
# 解释：输入的二进制串 00000000000000000000000000001011 中，共有三位为 '1'。
#
#
# 示例 2：
#
#
# 输入：00000000000000000000000010000000
# 输出：1
# 解释：输入的二进制串 00000000000000000000000010000000 中，共有一位为 '1'。
#
#
# 示例 3：
#
#
# 输入：11111111111111111111111111111101
# 输出：31
# 解释：输入的二进制串 11111111111111111111111111111101 中，共有 31 位为 '1'。
#
#
#
# 提示：
#
#
# 输入必须是长度为 32 的 二进制串 。
#
#
#
#
#
#
#
# 进阶：
#
#
# 如果多次调用这个函数，你将如何优化你的算法？
#
#
#

# @lc code=start
# class Solution:
#     def hammingWeight(self, n: int) -> int:
#         sum = 0
#         print(n)
#         print(str(n))
#         for i in str(n):
#             if i == "1":
#                 sum = sum+1
#         return sum

# 库函数
# class Solution:
#     def hammingWeight(self, n: int) -> int:
#         return bin(n).count("1")

# 位移
# 使用 n & 1 得到二进制末尾是否为 1；
# 把 n 右移 1 位，直至结束。

class Solution:
    def hammingWeight(self, n: int) -> int:
        res = 0
        while n:
            res += n & 1
            n >>= 1
        return res


# @lc code=end

"""
库函数 
 bin() : 将十进制数转换为2进制数的字符串形式
 >>> bin(666)
'0b1010011010'

str1.count('t')   # 查找字符串出现的次数
count("0"): 计算0的总数


位运算
x|y, x&y, x^y   # 位或、位与、位异或
x<<y, x>>y      # 位操作:x左移、右移y位

"""
