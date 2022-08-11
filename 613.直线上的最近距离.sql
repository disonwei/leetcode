--
-- @lc app=leetcode.cn id=613 lang=mysql
--
-- [613] 直线上的最近距离
--
-- https://leetcode.cn/problems/shortest-distance-in-a-line/description/
--
-- database
-- Easy (79.94%)
-- Likes:    48
-- Dislikes: 0
-- Total Accepted:    16.9K
-- Total Submissions: 21.1K
-- Testcase Example:  '{"headers":{"Point":["x"]},"rows":{"Point":[[-1],[0],[2]]}}'
--
-- 表 point 保存了一些点在 x 轴上的坐标，这些坐标都是整数。
-- 
-- 
-- 
-- 写一个查询语句，找到这些点中最近两个点之间的距离。
-- 
-- 
-- 
-- | x   |
-- |-----|
-- | -1  |
-- | 0   |
-- | 2   |
-- 
-- 
-- 
-- 
-- 最近距离显然是 '1' ，是点 '-1' 和 '0' 之间的距离。所以输出应该如下：
-- 
-- 
-- 
-- | shortest|
-- |---------|
-- | 1       |
-- 
-- 
-- 
-- 
-- 注意：每个点都与其他点坐标不同，表 table 不会有重复坐标出现。
-- 
-- 
-- 
-- 进阶：如果这些点在 x 轴上从左到右都有一个编号，输出结果时需要输出最近点对的编号呢？
-- 
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below


select min(abs(p1.x-p2.x)) as shortest
from `point` p1
inner join `point` p2
where p1.x!=p2.x

--  计算纵向数据某个字段的最小差值

-- @lc code=end

/*
考察点：
1. 表内连接
2. min 求最小值
3. abs 求绝对值
4. select 结果计算


*/