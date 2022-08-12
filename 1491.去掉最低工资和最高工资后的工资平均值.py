#
# @lc app=leetcode.cn id=1491 lang=python3
#
# [1491] 去掉最低工资和最高工资后的工资平均值
#
# https://leetcode.cn/problems/average-salary-excluding-the-minimum-and-maximum-salary/description/
#
# algorithms
# Easy (64.29%)
# Likes:    40
# Dislikes: 0
# Total Accepted:    38K
# Total Submissions: 59.1K
# Testcase Example:  '[4000,3000,1000,2000]'
#
# 给你一个整数数组 salary ，数组里每个数都是 唯一 的，其中 salary[i] 是第 i 个员工的工资。
#
# 请你返回去掉最低工资和最高工资以后，剩下员工工资的平均值。
#
#
#
# 示例 1：
#
# 输入：salary = [4000,3000,1000,2000]
# 输出：2500.00000
# 解释：最低工资和最高工资分别是 1000 和 4000 。
# 去掉最低工资和最高工资以后的平均工资是 (2000+3000)/2= 2500
#
#
# 示例 2：
#
# 输入：salary = [1000,2000,3000]
# 输出：2000.00000
# 解释：最低工资和最高工资分别是 1000 和 3000 。
# 去掉最低工资和最高工资以后的平均工资是 (2000)/1= 2000
#
#
# 示例 3：
#
# 输入：salary = [6000,5000,4000,3000,2000,1000]
# 输出：3500.00000
#
#
# 示例 4：
#
# 输入：salary = [8000,9000,2000,3000,6000,1000]
# 输出：4750.00000
#
#
#
#
# 提示：
#
#
# 3 <= salary.length <= 100
# 10^3 <= salary[i] <= 10^6
# salary[i] 是唯一的。
# 与真实值误差在 10^-5 以内的结果都将视为正确答案。
#
#
#

# @lc code=start
# class Solution:
#     def average(self, salary: List[int]) -> float:
#         s = sorted(salary)[1:-1]
#         return sum(s)/len(s)


class Solution:
    def average(self, salary: List[int]) -> float:
        sum, max, min = 0, salary[0], salary[0]
        for i in salary:
            if i < min:
                min = i
            elif i > max:
                max = i
            sum = sum+i
        return (sum-max-min)/(len(salary)-2)


# @lc code=end

# 列表 排序
# <list>.sort()
# <list> = sorted(<collection>)

# 列表 分片
# 左闭右开 [)
# 操作范围[m,n]—>实际范围[m,n-1]
# >>> numbers = [5, 1, -2, 67, 10, 23, 100]
# >>> numbers[2 : 4]
# [-2, 67]
# >>> numbers[2: -3]
# [-2, 67]
# 也可以加上步长，例如
# >>> numbers[0:6:2]
# [5, -2, 10]

# 列表 求和

# 寻找最大值 最小值
