--
-- @lc app=leetcode.cn id=585 lang=mysql
--
-- [585] 2016年的投资
--
-- https://leetcode.cn/problems/investments-in-2016/description/
--
-- database
-- Medium (49.75%)
-- Likes:    54
-- Dislikes: 0
-- Total Accepted:    13.2K
-- Total Submissions: 26.6K
-- Testcase Example:  '{"headers":{"Insurance":["pid","tiv_2015","tiv_2016","lat","lon"]},"rows":{"Insurance":[[1,10,5,10,10],[2,20,20,20,20],[3,10,30,20,20],[4,10,40,40,40]]}}'
--
-- 写一个查询语句，将 2016 年 (TIV_2016) 所有成功投资的金额加起来，保留 2 位小数。
-- 
-- 对于一个投保人，他在 2016 年成功投资的条件是：
-- 
-- 
-- 他在 2015 年的投保额 (TIV_2015) 至少跟一个其他投保人在 2015 年的投保额相同。
-- 他所在的城市必须与其他投保人都不同（也就是说维度和经度不能跟其他任何一个投保人完全相同）。
-- 
-- 
-- 输入格式:
-- 表 insurance 格式如下：
-- 
-- | Column Name | Type          |
-- |-------------|---------------|
-- | PID         | INTEGER(11)   |
-- | TIV_2015    | NUMERIC(15,2) |
-- | TIV_2016    | NUMERIC(15,2) |
-- | LAT         | NUMERIC(5,2)  |
-- | LON         | NUMERIC(5,2)  |
-- 
-- 
-- PID 字段是投保人的投保编号， TIV_2015 是该投保人在2015年的总投保金额， TIV_2016 是该投保人在2016年的投保金额， LAT
-- 是投保人所在城市的维度， LON 是投保人所在城市的经度。
-- 
-- 样例输入
-- 
-- | PID | TIV_2015 | TIV_2016 | LAT | LON |
-- |-----|----------|----------|-----|-----|
-- | 1   | 10       | 5        | 10  | 10  |
-- | 2   | 20       | 20       | 20  | 20  |
-- | 3   | 10       | 30       | 20  | 20  |
-- | 4   | 10       | 40       | 40  | 40  |
-- 
-- 
-- 样例输出
-- 
-- | TIV_2016 |
-- |----------|
-- | 45.00    |
-- 
-- 
-- 解释
-- 
-- 就如最后一个投保人，第一个投保人同时满足两个条件：
-- 1. 他在 2015 年的投保金额 TIV_2015 为 '10' ，与第三个和第四个投保人在 2015 年的投保金额相同。
-- 2. 他所在城市的经纬度是独一无二的。
-- 
-- 第二个投保人两个条件都不满足。他在 2015 年的投资 TIV_2015 与其他任何投保人都不相同。
-- 且他所在城市的经纬度与第三个投保人相同。基于同样的原因，第三个投保人投资失败。
-- 
-- 所以返回的结果是第一个投保人和最后一个投保人的 TIV_2016 之和，结果是 45 。
-- 
--

-- @lc code=start
# Write your MySQL query statement below

-- select round(i1.TIV_2016+i2.TIV_2016,2) as tiv_2016
-- -- select *
-- from insurance i1
-- inner join insurance i2
-- on i1.TIV_2015=i2.TIV_2015
-- and (i1.LAT!=i2.LAT or i1.LON!=i2.LON)
-- group by i1.TIV_2015



-- select *
-- from insurance i1
-- group by i1.TIV_2015
-- having count(*)>1



--  正解
--  2015 字段 不唯一 且
--  lat lon 字段唯一
select round(sum(TIV_2016),2) as TIV_2016
from insurance i1
where i1.TIV_2015 in (
    select TIV_2015
    from insurance
    group by TIV_2015
    having count(TIV_2015)>1 
)
and (i1.LAT,i1.LON) in (
    select LAT,LON
    from insurance
    group by LAT,LON
    having count(*)=1
)


-- @lc code=end

-- 检查每一个 TIV_2015 是否是唯一的，
-- 如果不是唯一的且同时坐标是唯一的，
-- 那么这条记录就符合题目要求。应该被统计到答案中。