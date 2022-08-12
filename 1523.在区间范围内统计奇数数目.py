#
# @lc app=leetcode.cn id=1523 lang=python3
#
# [1523] 在区间范围内统计奇数数目
#
# https://leetcode.cn/problems/count-odd-numbers-in-an-interval-range/description/
#
# algorithms
# Easy (50.64%)
# Likes:    59
# Dislikes: 0
# Total Accepted:    31.1K
# Total Submissions: 61.5K
# Testcase Example:  '3\n7'
#
# 给你两个非负整数 low 和 high 。请你返回 low 和 high 之间（包括二者）奇数的数目。
#
#
#
# 示例 1：
#
# 输入：low = 3, high = 7
# 输出：3
# 解释：3 到 7 之间奇数数字为 [3,5,7] 。
#
# 示例 2：
#
# 输入：low = 8, high = 10
# 输出：1
# 解释：8 到 10 之间奇数数字为 [9] 。
#
#
#
# 提示：
#
#
# 0 <= low <= high <= 10^9
#
#
#

# @lc code=start
# class Solution:
#     def countOdds(self, low: int, high: int) -> int:
#         sum = 0
#         for i in range(low, high+1):
#             if i % 2 == 1:
#                 sum = sum+1
#         return sum


# [3,4,5,6,7]  奇 奇  3 - 7      3
# [2,3,4,5,6,7,8] 偶 偶  2 - 8    3
# [3,4,5,6]  奇 偶  2   2

# class Solution:
#     def countOdds(self, low: int, high: int) -> int:
#         if low % 2 == 1 and high % 2 == 1:
#             return int((high-low)/2+1)
#         if low % 2 == 0 and high % 2 == 0:
#             return int((high-low)/2)
#         else:
#             return int((high-low+1)/2)


# class Solution:
#     def countOdds(self, low: int, high: int) -> int:
#         if high % 2:
#             high = high+1
#         if low % 2 == 1:
#             low = low-1
#         return int(high/2-low/2)


class Solution:
    def countOdds(self, low: int, high: int) -> int:
        if high % 2:
            high = high+1
        return int(high/2-low//2)

# @lc code=end


#  //  以返回商的整数部分（向下取整）
# 7 // 2 = 3 #（7 ÷ 2 = 3.5）
# 5 // 3 = 1 #(5 ÷ 3 = 1.6666666666666667)

# high为3或者4，加个1，然后除以2，奇数个数都是2
# 得出公式 (high+1)/2是区间【0，high】的奇数个数