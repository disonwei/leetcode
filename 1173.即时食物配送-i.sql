--
-- @lc app=leetcode.cn id=1173 lang=mysql
--
-- [1173] 即时食物配送 I
--
-- https://leetcode.cn/problems/immediate-food-delivery-i/description/
--
-- database
-- Easy (75.95%)
-- Likes:    35
-- Dislikes: 0
-- Total Accepted:    14.2K
-- Total Submissions: 18.7K
-- Testcase Example:  '{"headers":{"Delivery":["delivery_id","customer_id","order_date","customer_pref_delivery_date"]},"rows":{"Delivery":[[1,1,"2019-08-01","2019-08-02"],[2,5,"2019-08-02","2019-08-02"],[3,1,"2019-08-11","2019-08-11"],[4,3,"2019-08-24","2019-08-26"],[5,4,"2019-08-21","2019-08-22"],[6,2,"2019-08-11","2019-08-13"]]}}'
--
-- 配送表: Delivery
-- 
-- 
-- +-----------------------------+---------+
-- | Column Name                 | Type    |
-- +-----------------------------+---------+
-- | delivery_id                 | int     |
-- | customer_id                 | int     |
-- | order_date                  | date    |
-- | customer_pref_delivery_date | date    |
-- +-----------------------------+---------+
-- delivery_id 是表的主键。
-- 该表保存着顾客的食物配送信息，顾客在某个日期下了订单，并指定了一个期望的配送日期（和下单日期相同或者在那之后）。
-- 
-- 
-- 
-- 
-- 如果顾客期望的配送日期和下单日期相同，则该订单称为 「即时订单」，否则称为「计划订单」。
-- 
-- 写一条 SQL 查询语句获取即时订单所占的百分比， 保留两位小数。
-- 
-- 查询结果如下所示。
-- 
-- 
-- 
-- 示例 1:
-- 
-- 
-- 输入：
-- Delivery 表:
-- +-------------+-------------+------------+-----------------------------+
-- | delivery_id | customer_id | order_date | customer_pref_delivery_date |
-- +-------------+-------------+------------+-----------------------------+
-- | 1           | 1           | 2019-08-01 | 2019-08-02                  |
-- | 2           | 5           | 2019-08-02 | 2019-08-02                  |
-- | 3           | 1           | 2019-08-11 | 2019-08-11                  |
-- | 4           | 3           | 2019-08-24 | 2019-08-26                  |
-- | 5           | 4           | 2019-08-21 | 2019-08-22                  |
-- | 6           | 2           | 2019-08-11 | 2019-08-13                  |
-- +-------------+-------------+------------+-----------------------------+
-- 输出：
-- +----------------------+
-- | immediate_percentage |
-- +----------------------+
-- | 33.33                |
-- +----------------------+
-- 解释：2 和 3 号订单为即时订单，其他的为计划订单。
-- 
--

-- @lc code=start
# Write your MySQL query statement below


-- select round(sum_order_cunstomer/sum_order,2)

-- select count(*) as sum_order
-- from Delivery

-- select count(*) as sum_order_cunstomer
-- from Delivery
-- where order_date=customer_pref_delivery_date

-- 方法1
-- select round(
--     (select count(*) as sum_order_cunstomer from Delivery where order_date=customer_pref_delivery_date)/
--     (select count(*) as sum_order from Delivery)
--     ,2)*100 as immediate_percentage

-- 方法2
-- select
-- round( 
--     sum(case when order_date=customer_pref_delivery_date then 1 else 0 end)/count(*)*100
--     ,2) as immediate_percentage
-- from Delivery


-- 方法3
select 
round(
    sum(order_date=customer_pref_delivery_date)/count(*)*100,2
) as immediate_percentage
from Delivery


-- @lc code=end

/*
1. 直接select 查询


2. case when then else end 方法
*/

