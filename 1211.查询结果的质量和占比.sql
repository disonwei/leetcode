--
-- @lc app=leetcode.cn id=1211 lang=mysql
--
-- [1211] 查询结果的质量和占比
--
-- https://leetcode.cn/problems/queries-quality-and-percentage/description/
--
-- database
-- Easy (66.80%)
-- Likes:    33
-- Dislikes: 0
-- Total Accepted:    12.5K
-- Total Submissions: 18.7K
-- Testcase Example:  '{"headers":{"Queries":["query_name","result","position","rating"]},"rows":{"Queries":[["Dog","Golden Retriever",1,5],["Dog","German Shepherd",2,5],["Dog","Mule",200,1],["Cat","Shirazi",5,2],["Cat","Siamese",3,3],["Cat","Sphynx",7,4]]}}'
--
-- 查询表 Queries： 
-- 
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | query_name  | varchar |
-- | result      | varchar |
-- | position    | int     |
-- | rating      | int     |
-- +-------------+---------+
-- 此表没有主键，并可能有重复的行。
-- 此表包含了一些从数据库中收集的查询信息。
-- “位置”（position）列的值为 1 到 500 。
-- “评分”（rating）列的值为 1 到 5 。评分小于 3 的查询被定义为质量很差的查询。
-- 
-- 
-- 
-- 
-- 将查询结果的质量 quality 定义为：
-- 
-- 
-- 各查询结果的评分与其位置之间比率的平均值。
-- 
-- 
-- 将劣质查询百分比 poor_query_percentage 为：
-- 
-- 
-- 评分小于 3 的查询结果占全部查询结果的百分比。
-- 
-- 
-- 编写一组 SQL 来查找每次查询的名称(query_name)、质量(quality) 和
-- 劣质查询百分比(poor_query_percentage)。
-- 
-- 质量(quality) 和劣质查询百分比(poor_query_percentage) 都应四舍五入到小数点后两位。
-- 
-- 查询结果格式如下所示：
-- 
-- 
-- Queries table:
-- +------------+-------------------+----------+--------+
-- | query_name | result            | position | rating |
-- +------------+-------------------+----------+--------+
-- | Dog        | Golden Retriever  | 1        | 5      |
-- | Dog        | German Shepherd   | 2        | 5      |
-- | Dog        | Mule              | 200      | 1      |
-- | Cat        | Shirazi           | 5        | 2      |
-- | Cat        | Siamese           | 3        | 3      |
-- | Cat        | Sphynx            | 7        | 4      |
-- +------------+-------------------+----------+--------+
-- 
-- Result table:
-- +------------+---------+-----------------------+
-- | query_name | quality | poor_query_percentage |
-- +------------+---------+-----------------------+
-- | Dog        | 2.50    | 33.33                 |
-- | Cat        | 0.66    | 33.33                 |
-- +------------+---------+-----------------------+
-- 
-- Dog 查询结果的质量为 ((5 / 1) + (5 / 2) + (1 / 200)) / 3 = 2.50
-- Dog 查询结果的劣质查询百分比为 (1 / 3) * 100 = 33.33
-- 
-- Cat 查询结果的质量为 ((2 / 5) + (3 / 3) + (4 / 7)) / 3 = 0.66
-- Cat 查询结果的劣质查询百分比为 (1 / 3) * 100 = 33.33
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below

-- 方法1
-- select query_name,round(sum(rating/position)/count(query_name),2) as quality,round(sum(rating<3)/count(query_name)*100,2) as poor_query_percentage
-- from Queries
-- group by query_name


-- 方法2
select query_name,
       round(avg(rating/position),2) as quality,
       round(avg(rating<3)*100,2) as poor_query_percentage
from Queries
group BY query_name


-- 方法3
SELECT 
    query_name, 
    ROUND(AVG(rating/position), 2) quality,
    ROUND(SUM(IF(rating < 3, 1, 0)) * 100 / COUNT(*), 2) poor_query_percentage
FROM Queries
GROUP BY query_name

-- @lc code=end

/*

IF(rating < 3, 1, 0)

SUM(IF(rating < 3, 1, 0))

avg(条件)
*/