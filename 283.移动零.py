#
# @lc app=leetcode.cn id=283 lang=python3
#
# [283] 移动零
#
# https://leetcode.cn/problems/move-zeroes/description/
#
# algorithms
# Easy (64.07%)
# Likes:    1700
# Dislikes: 0
# Total Accepted:    838.2K
# Total Submissions: 1.3M
# Testcase Example:  '[0,1,0,3,12]'
#
# 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
#
# 请注意 ，必须在不复制数组的情况下原地对数组进行操作。
#
#
#
# 示例 1:
#
#
# 输入: nums = [0,1,0,3,12]
# 输出: [1,3,12,0,0]
#
#
# 示例 2:
#
#
# 输入: nums = [0]
# 输出: [0]
#
#
#
# 提示:
#
#
#
# 1 <= nums.length <= 10^4
# -2^31 <= nums[i] <= 2^31 - 1
#
#
#
#
# 进阶：你能尽量减少完成的操作次数吗？
#
#

# @lc code=start

# 方法1  超时

# class Solution:
#     def moveZeroes(self, nums: List[int]) -> None:
#         """
#         Do not return anything, modify nums in-place instead.
#         """
#         for i in range(len(nums)):
#             for j in range(1,len(nums)-i):
#                 if nums[j-1]==0:
#                     nums[j-1],nums[j]=nums[j],nums[j-1]

#         return nums


class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        left, right = 0, 0
        for i in range(len(nums)):
            if nums[right] != 0:
                nums[left], nums[right] = nums[right], nums[left]
                left += 1
            right += 1


# @lc code=end
"""
方法一: 冒泡方法 超时


方法2: 快慢指针

快指针移动 不是0 与 慢指针交换
慢指针+1 快指针+1

"""
