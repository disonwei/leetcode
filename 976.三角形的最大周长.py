#
# @lc app=leetcode.cn id=976 lang=python3
#
# [976] 三角形的最大周长
#
# https://leetcode.cn/problems/largest-perimeter-triangle/description/
#
# algorithms
# Easy (58.29%)
# Likes:    202
# Dislikes: 0
# Total Accepted:    71.7K
# Total Submissions: 123.1K
# Testcase Example:  '[2,1,2]'
#
# 给定由一些正数（代表长度）组成的数组 nums ，返回 由其中三个长度组成的、面积不为零的三角形的最大周长 。如果不能形成任何面积不为零的三角形，返回
# 0。
#
#
#
#
#
#
# 示例 1：
#
#
# 输入：nums = [2,1,2]
# 输出：5
#
#
# 示例 2：
#
#
# 输入：nums = [1,2,1]
# 输出：0
#
#
#
#
# 提示：
#
#
# 3 <= nums.length <= 10^4
# 1 <= nums[i] <= 10^6
#
#
#

# @lc code=start
# class Solution:
#     def largestPerimeter(self, nums: List[int]) -> int:

#         # 三角形 任意两边之和大于第三边
#         nums = sorted(nums, reverse=True)
#         for i in range(len(nums)-2):
#             if nums[i] < nums[i+1]+nums[i+2]:
#                 return nums[i]+nums[i+1]+nums[i+2]
#         return 0

#  方法2

class Solution:
    def largestPerimeter(self, nums: List[int]) -> int:
        nums = sorted(nums, reverse=True)
        # zip(nums,nums[1:],nums[2:])

        return next((x+y+z for x, y, z in zip(nums, nums[1:], nums[2:]) if x<y+z),0)


# @lc code=end
"""
思路:贪心与排序

三角形：  任意两边之和大于第三边  a+b>c
面积最大： c取最大 a b 分别最次最大 
对列表进行排序  sort()  list=sorted()
排序后 根据 nums[i]<nums[i-1]+nums[i+1]

sorted(nums, reverse=True) 从大到小排序



法2:

zip()

a = [1, 2, 3,4,5,6],  b = ["a", "b", "c"]
z = zip(a, b)  # 压缩：[(1, "a"), (2, "b"), (3, "c")]


zip(a,a[1:],a[2:])
# for i in b:
    # print(i)
 
# (1, 2, 3)
# (2, 3, 4)
# (3, 4, 5)
# (4, 5, 6)

# 直接读取元组中的数值 
for x,y,z in b:
    print(x,y,z) 

# 1 2 3
# 2 3 4
# 3 4 5
# 4 5 6


next(iterobject,defalt)
第一个参数是可迭代的对象
第二个参数可以写也可以不写
不写的时候,如果可迭代的元素取出完毕,会返回StopIteration异常,
写的时候，当可迭代对象迭代完后，会返回一直返回第二个参数写的那个元素。

迭代器与生成器
https://blog.csdn.net/Argonaut_/article/details/123797376
"""
