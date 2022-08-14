--
-- @lc app=leetcode.cn id=1251 lang=mysql
--
-- [1251] 平均售价
--
-- https://leetcode.cn/problems/average-selling-price/description/
--
-- database
-- Easy (76.88%)
-- Likes:    40
-- Dislikes: 0
-- Total Accepted:    13.8K
-- Total Submissions: 17.9K
-- Testcase Example:  '{"headers":{"Prices":["product_id","start_date","end_date","price"],"UnitsSold":["product_id","purchase_date","units"]},"rows":{"Prices":[[1,"2019-02-17","2019-02-28",5],[1,"2019-03-01","2019-03-22",20],[2,"2019-02-01","2019-02-20",15],[2,"2019-02-21","2019-03-31",30]],"UnitsSold":[[1,"2019-02-25",100],[1,"2019-03-01",15],[2,"2019-02-10",200],[2,"2019-03-22",30]]}}'
--
-- Table: Prices
-- 
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | start_date    | date    |
-- | end_date      | date    |
-- | price         | int     |
-- +---------------+---------+
-- (product_id，start_date，end_date) 是 Prices 表的主键。
-- Prices 表的每一行表示的是某个产品在一段时期内的价格。
-- 每个产品的对应时间段是不会重叠的，这也意味着同一个产品的价格时段不会出现交叉。
-- 
-- 
-- 
-- Table: UnitsSold
-- 
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | purchase_date | date    |
-- | units         | int     |
-- +---------------+---------+
-- UnitsSold 表没有主键，它可能包含重复项。
-- UnitsSold 表的每一行表示的是每种产品的出售日期，单位和产品 id。
-- 
-- 
-- 
-- 编写SQL查询以查找每种产品的平均售价。
-- average_price 应该四舍五入到小数点后两位。
-- 查询结果格式如下例所示：
-- 
-- 
-- Prices table:
-- +------------+------------+------------+--------+
-- | product_id | start_date | end_date   | price  |
-- +------------+------------+------------+--------+
-- | 1          | 2019-02-17 | 2019-02-28 | 5      |
-- | 1          | 2019-03-01 | 2019-03-22 | 20     |
-- | 2          | 2019-02-01 | 2019-02-20 | 15     |
-- | 2          | 2019-02-21 | 2019-03-31 | 30     |
-- +------------+------------+------------+--------+
-- ⁠
-- UnitsSold table:
-- +------------+---------------+-------+
-- | product_id | purchase_date | units |
-- +------------+---------------+-------+
-- | 1          | 2019-02-25    | 100   |
-- | 1          | 2019-03-01    | 15    |
-- | 2          | 2019-02-10    | 200   |
-- | 2          | 2019-03-22    | 30    |
-- +------------+---------------+-------+
-- 
-- Result table:
-- +------------+---------------+
-- | product_id | average_price |
-- +------------+---------------+
-- | 1          | 6.96          |
-- | 2          | 16.96         |
-- +------------+---------------+
-- 平均售价 = 产品总价 / 销售的产品数量。
-- 产品 1 的平均售价 = ((100 * 5)+(15 * 20) )/ 115 = 6.96
-- 产品 2 的平均售价 = ((200 * 15)+(30 * 30) )/ 230 = 16.96
-- 
--

-- @lc code=start
# Write your MySQL query statement below


select p1.product_id,round(sum(p1.price*u1.units)/sum(u1.units),2) as average_price
from Prices p1
left join UnitsSold u1
on p1.product_id=u1.product_id
where u1.purchase_date between p1.start_date and p1.end_date
group by p1.product_id


-- @lc code=end

/*
左关联
筛选时间范围内
分组

*/
