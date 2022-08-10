--
-- @lc app=leetcode.cn id=603 lang=mysql
--
-- [603] 连续空余座位
--
-- https://leetcode.cn/problems/consecutive-available-seats/description/
--
-- database
-- Easy (64.91%)
-- Likes:    111
-- Dislikes: 0
-- Total Accepted:    20.8K
-- Total Submissions: 32K
-- Testcase Example:  '{"headers":{"Cinema":["seat_id","free"]},"rows":{"Cinema":[[1,1],[2,0],[3,1],[4,1],[5,1]]}}'
--
-- 表: Cinema
-- 
-- 
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | seat_id     | int  |
-- | free        | bool |
-- +-------------+------+
-- Seat_id是该表的自动递增主键列。
-- 该表的每一行表示第i个座位是否空闲。1表示空闲，0表示被占用。
-- 
-- 
-- 
-- 编写一个SQL查询来报告电影院所有连续可用的座位。
-- 
-- 返回按 seat_id 升序排序 的结果表。
-- 
-- 测试用例的生成使得两个以上的座位连续可用。
-- 
-- 查询结果格式如下所示。
-- 
-- 
-- 
-- 示例 1:
-- 
-- 
-- 输入: 
-- Cinema 表:
-- +---------+------+
-- | seat_id | free |
-- +---------+------+
-- | 1       | 1    |
-- | 2       | 0    |
-- | 3       | 1    |
-- | 4       | 1    |
-- | 5       | 1    |
-- +---------+------+
-- 输出: 
-- +---------+
-- | seat_id |
-- +---------+
-- | 3       |
-- | 4       |
-- | 5       |
-- +---------+
-- 
--

-- @lc code=start
# Write your MySQL query statement below

-- select seat_id
-- from Cinema
-- where free = 1

-- select c1.seat_id,c2.seat_id
-- from Cinema c1
-- inner join Cinema c2
-- on c1.free=1 and c2.free=1

select distinct c1.seat_id
from Cinema c1
inner join Cinema c2
on c1.free=1 and c2.free=1
where abs(c1.seat_id-c2.seat_id)=1
order by c1.seat_id

-- @lc code=end

/*
考察点:
1.  自连接

2. abs 
返回一个数值的绝对值
*/