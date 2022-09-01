#
# @lc app=leetcode.cn id=136 lang=python3
#
# [136] 只出现一次的数字
#
# https://leetcode.cn/problems/single-number/description/
#
# algorithms
# Easy (72.27%)
# Likes:    2548
# Dislikes: 0
# Total Accepted:    767.4K
# Total Submissions: 1.1M
# Testcase Example:  '[2,2,1]'
#
# 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
#
# 说明：
#
# 你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
#
# 示例 1:
#
# 输入: [2,2,1]
# 输出: 1
#
#
# 示例 2:
#
# 输入: [4,1,2,1,2]
# 输出: 4
#
#

# @lc code=start
# class Solution:
#     def singleNumber(self, nums: List[int]) -> int:
#         low = 0
#         fast = 1
#         nums = sorted(nums)

#         while low < len(nums):
#             if nums[low] == nums[low+1]:
#                 low += 2
#             else:
#                 nums[low]
#                 break

# 方法1
# class Solution:
#     def singleNumber(self, nums: List[int]) -> int:
#         return 2*sum(set(nums))-sum(nums)


# 方法2
# 异或
"""
a ^ a = 0
a ^ 0 = a
a ^ b ^ c = a ^ c ^ b

注：一个值连续跟两个相同的数异或仍未其本身，可用来统计列表中只出现一次的元素

4^8=12

12^8=4

4^8^8 = 4
"""
class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        res = 0
        for i in nums:
            print(res)
            res ^= i
        return res


# @lc code=end
"""
 1 3 1 4 3

 1 1 3  3 4

2 2 1
 2  1   6 

 4+1  5 

"""
