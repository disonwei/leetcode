#
# @lc app=leetcode.cn id=121 lang=python3
#
# [121] 买卖股票的最佳时机
#
# https://leetcode.cn/problems/best-time-to-buy-and-sell-stock/description/
#
# algorithms
# Easy (58.16%)
# Likes:    2532
# Dislikes: 0
# Total Accepted:    902.3K
# Total Submissions: 1.6M
# Testcase Example:  '[7,1,5,3,6,4]'
#
# 给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。
#
# 你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。
#
# 返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。
#
#
#
# 示例 1：
#
#
# 输入：[7,1,5,3,6,4]
# 输出：5
# 解释：在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
# ⁠    注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。
#
#
# 示例 2：
#
#
# 输入：prices = [7,6,4,3,1]
# 输出：0
# 解释：在这种情况下, 没有交易完成, 所以最大利润为 0。
#
#
#
#
# 提示：
#
#
# 1
# 0
#
#
#

# @lc code=start

#  方法1 暴力法
# 双重循环  超时
# class Solution:
#     def maxProfit(self, prices: List[int]) -> int:
#         price = []
#         l = len(prices)
#         for i in range(l):
#             for j in range(i+1, l):
#                 if prices[i] < prices[j]:
#                     # print([prices[i], prices[j]])
#                     price.append(prices[j]-prices[i])

#         return max(price) if len(price) else 0

# 方法2 贪心
"""
思路:
循环列表
计算价格差
"""
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        min_price = prices[0]
        diff_price = 0
        for price in prices[1:]:
            if diff_price<price-min_price:
                diff_price=price-min_price

            if price < min_price:
                min_price = price

        return diff_price


# @lc code=end
