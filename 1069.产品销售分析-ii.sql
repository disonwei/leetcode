--
-- @lc app=leetcode.cn id=1069 lang=mysql
--
-- [1069] 产品销售分析 II
--
-- https://leetcode.cn/problems/product-sales-analysis-ii/description/
--
-- database
-- Easy (81.42%)
-- Likes:    19
-- Dislikes: 0
-- Total Accepted:    16K
-- Total Submissions: 19.6K
-- Testcase Example:  '{"headers":{"Sales":["sale_id","product_id","year","quantity","price"],"Product":["product_id","product_name"]},"rows":{"Sales":[[1,100,2008,10,5000],[2,100,2009,12,5000],[7,200,2011,15,9000]],"Product":[[100,"Nokia"],[200,"Apple"],[300,"Samsung"]]}}'
--
-- 销售表：Sales
-- 
-- +-------------+-------+
-- | Column Name | Type  |
-- +-------------+-------+
-- | sale_id     | int   |
-- | product_id  | int   |
-- | year        | int   |
-- | quantity    | int   |
-- | price       | int   |
-- +-------------+-------+
-- sale_id 是这个表的主键。
-- product_id 是 Product 表的外键。
-- 请注意价格是每单位的。
-- 
-- 
-- 产品表：Product
-- 
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | product_id   | int     |
-- | product_name | varchar |
-- +--------------+---------+
-- product_id 是这个表的主键。
-- 
-- 
-- 
-- 
-- 编写一个 SQL 查询，按产品 id product_id 来统计每个产品的销售总量。
-- 
-- 
-- 
-- 查询结果格式如下面例子所示:
-- 
-- Sales 表：
-- +---------+------------+------+----------+-------+
-- | sale_id | product_id | year | quantity | price |
-- +---------+------------+------+----------+-------+ 
-- | 1       | 100        | 2008 | 10       | 5000  |
-- | 2       | 100        | 2009 | 12       | 5000  |
-- | 7       | 200        | 2011 | 15       | 9000  |
-- +---------+------------+------+----------+-------+
-- 
-- Product 表：
-- +------------+--------------+
-- | product_id | product_name |
-- +------------+--------------+
-- | 100        | Nokia        |
-- | 200        | Apple        |
-- | 300        | Samsung      |
-- +------------+--------------+
-- 
-- Result 表：
-- +--------------+----------------+
-- | product_id   | total_quantity |
-- +--------------+----------------+
-- | 100          | 22             |
-- | 200          | 15             |
-- +--------------+----------------+
-- 
--

-- @lc code=start
# Write your MySQL query statement below

-- select product_id,sun(quantity) total_quantity
-- from Sales
-- group by product_id



select
    product_id,
    sum(quantity) as total_quantity
from Sales
group by product_id

-- @lc code=end

