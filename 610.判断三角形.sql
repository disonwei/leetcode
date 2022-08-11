--
-- @lc app=leetcode.cn id=610 lang=mysql
--
-- [610] 判断三角形
--
-- https://leetcode.cn/problems/triangle-judgement/description/
--
-- database
-- Easy (63.69%)
-- Likes:    31
-- Dislikes: 0
-- Total Accepted:    15.7K
-- Total Submissions: 24.7K
-- Testcase Example:  '{"headers":{"triangle":["x","y","z"]},"rows":{"triangle":[[13,15,30],[10,20,15]]}}'
--
-- 表: Triangle
-- 
-- 
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | x           | int  |
-- | y           | int  |
-- | z           | int  |
-- +-------------+------+
-- (x, y, z)是该表的主键列。
-- 该表的每一行包含三个线段的长度。
-- 
-- 
-- 
-- 
-- 写一个SQL查询，每三个线段报告它们是否可以形成一个三角形。
-- 
-- 以 任意顺序 返回结果表。
-- 
-- 查询结果格式如下所示。
-- 
-- 
-- 
-- 示例 1:
-- 
-- 
-- 输入: 
-- Triangle 表:
-- +----+----+----+
-- | x  | y  | z  |
-- +----+----+----+
-- | 13 | 15 | 30 |
-- | 10 | 20 | 15 |
-- +----+----+----+
-- 输出: 
-- +----+----+----+----------+
-- | x  | y  | z  | triangle |
-- +----+----+----+----------+
-- | 13 | 15 | 30 | No       |
-- | 10 | 20 | 15 | Yes      |
-- +----+----+----+----------+
-- 
--

-- @lc code=start
# Write your MySQL query statement below

-- select x,y,z,triangle
-- from Triangle

select x,y,z,
(case when x+y>z and x+z>y and z+y>x then "Yes"
else "No" end) as triangle
from Triangle



-- @lc code=end
/*

考察点：
1. case when
https://blog.csdn.net/rongtaoup/article/details/82183743
https://blog.csdn.net/qq_42508714/article/details/103129088?spm=1001.2101.3001.6661.1&utm_medium=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1-103129088-blog-82183743.pc_relevant_multi_platform_featuressortv2removedup&depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1-103129088-blog-82183743.pc_relevant_multi_platform_featuressortv2removedup&utm_relevant_index=1
*/