#
# @lc app=leetcode.cn id=70 lang=python3
#
# [70] 爬楼梯
#
# https://leetcode.cn/problems/climbing-stairs/description/
#
# algorithms
# Easy (53.92%)
# Likes:    2574
# Dislikes: 0
# Total Accepted:    918.2K
# Total Submissions: 1.7M
# Testcase Example:  '2'
#
# 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
# 
# 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
# 
# 
# 
# 示例 1：
# 
# 
# 输入：n = 2
# 输出：2
# 解释：有两种方法可以爬到楼顶。
# 1. 1 阶 + 1 阶
# 2. 2 阶
# 
# 示例 2：
# 
# 
# 输入：n = 3
# 输出：3
# 解释：有三种方法可以爬到楼顶。
# 1. 1 阶 + 1 阶 + 1 阶
# 2. 1 阶 + 2 阶
# 3. 2 阶 + 1 阶
# 
# 
# 
# 
# 提示：
# 
# 
# 1 <= n <= 45
# 
# 
#

# @lc code=start
# class Solution:
#     @lru_cache(None)
#     def climbStairs(self, n: int) -> int:

#         if n==1:
#             return 1
#         if n==2:
#             return 2
#         return self.climbStairs(n-1)+self.climbStairs(n-2)
        
# 方法2 
#@lc code=start
class Solution:
    def climbStairs(self, n: int) -> int:
        if n<=2:
            return n
        p,q=1,2
        for _ in range(3,n+1):
            p,q=q,p+q
        return q



# @lc code=end

# n=1 1       1
# n=2 1 1 2   2
# n=3 1 1 1   1 2  2 1   3
# n=4 1 1 1 1  2 2  1 2 1  2 1 1  1 2 2   5
# f(x)=f(x-1)+f(x-2)

# 动态规划  递归

# 1. 装饰器  @lru_cache(None)
# 若某参数n为第一次调用climbStairs方法，则执行并将结果放入缓存；
# 若参数n不是第一次调用climbStairs方法，则直接从缓存中调取结果，以节省时间；

# range() [)  左闭右开