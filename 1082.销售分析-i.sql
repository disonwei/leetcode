--
-- @lc app=leetcode.cn id=1082 lang=mysql
--
-- [1082] 销售分析 I 
--
-- https://leetcode.cn/problems/sales-analysis-i/description/
--
-- database
-- Easy (76.39%)
-- Likes:    49
-- Dislikes: 0
-- Total Accepted:    17K
-- Total Submissions: 22.3K
-- Testcase Example:  '{"headers":{"Product":["product_id","product_name","unit_price"],"Sales":["seller_id","product_id","buyer_id","sale_date","quantity","price"]},"rows":{"Product":[[1,"S8",1000],[2,"G4",800],[3,"iPhone",1400]],"Sales":[[1,1,1,"2019-01-21",2,2000],[1,2,2,"2019-02-17",1,800],[2,2,3,"2019-06-02",1,800],[3,3,4,"2019-05-13",2,2800]]}}\r'
--
-- 产品表：Product
-- 
-- 
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | product_id   | int     |
-- | product_name | varchar |
-- | unit_price   | int     |
-- +--------------+---------+
-- product_id 是这个表的主键.
-- 该表的每一行显示每个产品的名称和价格。
-- 
-- 
-- 销售表：Sales
-- 
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
-- 这个表没有主键，它可以有重复的行。 
-- product_id 是 Product 表的外键。
-- 该表的每一行包含关于一个销售的一些信息。
-- 
-- 
-- 
-- 
-- 编写一个 SQL 查询，查询总销售额最高的销售者，如果有并列的，就都展示出来。
-- 
-- 以 任意顺序 返回结果表。
-- 
-- 查询结果格式如下所示。
-- 
-- 
-- 
-- 示例 1:
-- 
-- 
-- 输入：
-- Product 表：
-- +------------+--------------+------------+
-- | product_id | product_name | unit_price |
-- +------------+--------------+------------+
-- | 1          | S8           | 1000       |
-- | 2          | G4           | 800        |
-- | 3          | iPhone       | 1400       |
-- +------------+--------------+------------+
-- Sales 表：
-- +-----------+------------+----------+------------+----------+-------+
-- | seller_id | product_id | buyer_id | sale_date  | quantity | price |
-- +-----------+------------+----------+------------+----------+-------+
-- | 1         | 1          | 1        | 2019-01-21 | 2        | 2000  |
-- | 1         | 2          | 2        | 2019-02-17 | 1        | 800   |
-- | 2         | 2          | 3        | 2019-06-02 | 1        | 800   |
-- | 3         | 3          | 4        | 2019-05-13 | 2        | 2800  |
-- +-----------+------------+----------+------------+----------+-------+
-- 输出：
-- +-------------+
-- | seller_id   |
-- +-------------+
-- | 1           |
-- | 3           |
-- +-------------+
-- 解释：Id 为 1 和 3 的销售者，销售总金额都为最高的 2800。
-- 
--

-- @lc code=start
# Write your MySQL query statement below

-- select seller_id,sum(price)
-- from Sales
-- group by seller_id


-- select seller_id
-- from Sales
-- group by seller_id
-- order by count(price) DESC
-- limit 1


-- select seller_id,sum(price)
-- from Sales
-- group by seller_id

-- select seller_id
-- from Sales
-- where 


-- 正解
select seller_id
from Sales
group by seller_id
having sum(price)>=all(
    select sum(price)
    from Sales
    group by seller_id
)



-- @lc code=end

