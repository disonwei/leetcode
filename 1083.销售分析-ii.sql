--
-- @lc app=leetcode.cn id=1083 lang=mysql
--
-- [1083] 销售分析 II
--
-- https://leetcode.cn/problems/sales-analysis-ii/description/
--
-- database
-- Easy (52.69%)
-- Likes:    43
-- Dislikes: 0
-- Total Accepted:    15.8K
-- Total Submissions: 30K
-- Testcase Example:  '{"headers":{"Product":["product_id","product_name","unit_price"],"Sales":["seller_id","product_id","buyer_id","sale_date","quantity","price"]},"rows":{"Product":[[1,"S8",1000],[2,"G4",800],[3,"iPhone",1400]],"Sales":[[1,1,1,"2019-01-21",2,2000],[1,2,2,"2019-02-17",1,800],[2,1,3,"2019-06-02",1,800],[3,3,3,"2019-05-13",2,2800]]}}'
--
-- Table: Product
-- 
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | product_id   | int     |
-- | product_name | varchar |
-- | unit_price   | int     |
-- +--------------+---------+
-- product_id 是这张表的主键
-- 
-- 
-- Table: Sales
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | seller_id   | int     |
-- | product_id  | int     |
-- | buyer_id    | int     |
-- | sale_date   | date    |
-- | quantity    | int     |
-- | price       | int     |
-- +------ ------+---------+
-- 这个表没有主键，它可以有重复的行.
-- product_id 是 Product 表的外键.
-- 
-- 
-- 编写一个 SQL 查询，查询购买了 S8 手机却没有购买 iPhone 的买家。注意这里 S8 和 iPhone 是 Product 表中的产品。
-- 
-- 查询结果格式如下图表示：
-- 
-- Product table:
-- +------------+--------------+------------+
-- | product_id | product_name | unit_price |
-- +------------+--------------+------------+
-- | 1          | S8           | 1000       |
-- | 2          | G4           | 800        |
-- | 3          | iPhone       | 1400       |
-- +------------+--------------+------------+
-- 
-- Sales table:
-- +-----------+------------+----------+------------+----------+-------+
-- | seller_id | product_id | buyer_id | sale_date  | quantity | price |
-- +-----------+------------+----------+------------+----------+-------+
-- | 1         | 1          | 1        | 2019-01-21 | 2        | 2000  |
-- | 1         | 2          | 2        | 2019-02-17 | 1        | 800   |
-- | 2         | 1          | 3        | 2019-06-02 | 1        | 800   |
-- | 3         | 3          | 3        | 2019-05-13 | 2        | 2800  |
-- +-----------+------------+----------+------------+----------+-------+
-- 
-- Result table:
-- +-------------+
-- | buyer_id    |
-- +-------------+
-- | 1           |
-- +-------------+
-- id 为 1 的买家购买了一部 S8，但是却没有购买 iPhone，而 id 为 3 的买家却同时购买了这 2 部手机。
-- 
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below

-- select buyer_id
-- from Sales s
-- left join Product p
-- on s.product_id=p.product_id
-- group by buyer_id
-- having product_name="S8" and product_name != "iPhone"
-- -- where 



-- select buyer_id
-- from Sales s
-- left join (
-- select *
-- from Product
-- where product_name!="iPhone"
-- ) p
-- on s.product_id=p.product_id
-- where p.product_name="S8"

-- select buyer_id
-- from Sales s
-- left join Product p
-- on s.product_id=p.product_id
-- group by buyer_id
-- having p.product_name="S8" and product_name !="iPhone"


--  正解
select buyer_id
from Sales s
left join Product p
on s.product_id=p.product_id
group by buyer_id
having sum(product_name="S8")>0 and sum(product_name="iPhone")=0


-- @lc code=end

/*
分组后 不能使用 where product_name = 'S8' and product_name != 'iPhone'
使用  having sum(product_name="S8")>0 and sum(product_name="iPhone")=0
*/