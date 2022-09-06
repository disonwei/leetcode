#
# @lc app=leetcode.cn id=169 lang=python3
#
# [169] 多数元素
#
# https://leetcode.cn/problems/majority-element/description/
#
# algorithms
# Easy (66.94%)
# Likes:    1551
# Dislikes: 0
# Total Accepted:    584.8K
# Total Submissions: 873.7K
# Testcase Example:  '[3,2,3]'
#
# 给定一个大小为 n 的数组 nums ，返回其中的多数元素。多数元素是指在数组中出现次数 大于 ⌊ n/2 ⌋ 的元素。
#
# 你可以假设数组是非空的，并且给定的数组总是存在多数元素。
#
#
#
# 示例 1：
#
#
# 输入：nums = [3,2,3]
# 输出：3
#
# 示例 2：
#
#
# 输入：nums = [2,2,1,1,1,2,2]
# 输出：2
#
#
#
# 提示：
#
#
# n == nums.length
# 1 <= n <= 5 * 10^4
# -10^9 <= nums[i] <= 10^9
#
#
#
#
# 进阶：尝试设计时间复杂度为 O(n)、空间复杂度为 O(1) 的算法解决此问题。
#
#

# @lc code=start

# 方法1  哈希
# class Solution:
#     def majorityElement(self, nums: List[int]) -> int:
#         hash_count = {}
#         for i in nums:
#             if i in hash_count:
#                 hash_count[i] += 1
#             else:
#                 hash_count[i] = 1

#         item = sorted(hash_count.items(),
#                       key=lambda count: count[1], reverse=True)
#         return (item[0][0])


# 方法1 简化版本   Counter
# class Solution:
#     def majorityElement(self, nums: List[int]) -> int:
#         return Counter(nums).most_common()[0][0]


# 方法2  sort 错误
# class Solution:
#     def majorityElement(self, nums: List[int]) -> int:
#         nums = sorted(nums)
#         count = 0
#         max_count = 0
#         for i in range(1, len(nums)):
#             if nums[i] == nums[i-1]:
#                 count += 1
#             else:
#                 if max_count < count:
#                     max_count = count
#                 count = 0
#         return max_count

# 方法2
# class Solution:
#     def majorityElement(self, nums: List[int]) -> int:
#         nums.sort()
#         return nums[len(nums)//2]

# 方法3
class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        hash_dict = dict()
        for i in set(nums):
            hash_dict[i] = nums.count(i)

        item = sorted(hash_dict.items(), key=lambda i: i[1], reverse=True)
        return item[0][0]


# @lc code=end


"""
Counter 方法
可以用来统计一个 python 列表、字符串、元组等可迭代对象中每个元素出现的次数，并返回一个字典

from collection import Counter

1、统计列表中的词频:
list_1 = ['hh', "hh", "k", "f"]
counter = Counter(list_1)
print(counter)
for k, v in counter.items():
    print(k, v)


Counter({'hh': 2, 'k': 1, 'f': 1})
hh 2
k 1
f 1


2、统计字符串中的次数:
str1="jjjkkkkyyy"
counter = Counter(str1)
print(counter)

Counter({'k': 4, 'j': 3, 'y': 3})


3、统计元组中的次数:

tuple1 = ("aa", "n", "国家", "aa")
counter = Counter(tuple1 )
print(counter)

Counter({'aa': 2, 'n': 1, '国家': 1})

使用 Counter 统计完词频后可以使用 most_common 方法来查找出现频率最高的 n 个数字及其出现次数
ansdict = counter.most_common(2)  # 返回出现次数最多的两个数及其出现的次数
print(ansdict) # 注意输出格式
ans = []
for i in range(len(ansdict)):
    ans.append(ansdict[i][0])  # 提取出出现次数最多的两个数
print(ans)


[('hh', 2), ('k', 2)]
['hh', 'k']
"""
