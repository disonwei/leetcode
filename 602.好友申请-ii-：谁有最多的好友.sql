--
-- @lc app=leetcode.cn id=602 lang=mysql
--
-- [602] 好友申请 II ：谁有最多的好友
--
-- https://leetcode.cn/problems/friend-requests-ii-who-has-the-most-friends/description/
--
-- database
-- Medium (60.36%)
-- Likes:    56
-- Dislikes: 0
-- Total Accepted:    13.4K
-- Total Submissions: 22.2K
-- Testcase Example:  '{"headers":{"RequestAccepted":["requester_id","accepter_id","accept_date"]},"rows":{"RequestAccepted":[[1,2,"2016/06/03"],[1,3,"2016/06/08"],[2,3,"2016/06/08"],[3,4,"2016/06/09"]]}}'
--
-- 在 Facebook 或者 Twitter 这样的社交应用中，人们经常会发好友申请也会收到其他人的好友申请。
-- 
-- 
-- 
-- RequestAccepted 表：
-- 
-- 
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | requester_id   | int     |
-- | accepter_id    | int     |
-- | accept_date    | date    |
-- +----------------+---------+
-- (requester_id, accepter_id) 是这张表的主键。
-- 这张表包含发送好友请求的人的 ID ，接收好友请求的人的 ID ，以及好友请求通过的日期。
-- 
-- 
-- 
-- 
-- 写一个查询语句，找出拥有最多的好友的人和他拥有的好友数目。
-- 
-- 生成的测试用例保证拥有最多好友数目的只有 1 个人。
-- 
-- 查询结果格式如下例所示。
-- 
-- 
-- 
-- 示例：
-- 
-- 
-- 输入：
-- RequestAccepted 表：
-- +--------------+-------------+-------------+
-- | requester_id | accepter_id | accept_date |
-- +--------------+-------------+-------------+
-- | 1            | 2           | 2016/06/03  |
-- | 1            | 3           | 2016/06/08  |
-- | 2            | 3           | 2016/06/08  |
-- | 3            | 4           | 2016/06/09  |
-- +--------------+-------------+-------------+
-- 输出：
-- +----+-----+
-- | id | num |
-- +----+-----+
-- | 3  | 3   |
-- +----+-----+
-- 解释：
-- 编号为 3 的人是编号为 1 ，2 和 4 的人的好友，所以他总共有 3 个好友，比其他人都多。
-- 
-- 
-- 
-- 进阶：在真实世界里，可能会有多个人拥有好友数相同且最多，你能找到所有这些人吗？
-- 
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below

-- -- select r1.requester_id, count(r2.requester_id) as num
-- select *
-- from RequestAccepted r1
-- inner join RequestAccepted r2
-- on r1.accepter_id=r2.requester_id
-- group by r1.requester_id
-- -- order by count(r2.requester_id)
-- -- limit 1




-- 正解
-- 联合
-- select requester_id
-- from RequestAccepted
-- UNION all
-- select accepter_id
-- from RequestAccepted


select id,count(*) as num
from (
select requester_id id
from RequestAccepted
UNION all
select accepter_id id
from RequestAccepted
) as t
group by id
order by count(*) desc
limit 1


-- @lc code=end


-- UNION 与  union all
-- 用于合并两个或多个 SELECT 语句的结果集
-- UNION 内部的 SELECT 语句必须拥有相同数量的列。
-- 列也必须拥有相似的数据类型

--  UNION

-- SELECT column_name(s) FROM table_name1
-- UNION
-- SELECT column_name(s) FROM table_name2

-- union all

-- SELECT column_name(s) FROM table_name1
-- UNION ALL
-- SELECT column_name(s) FROM table_name2

-- UNION 命令只会选取不同的值
-- UNION ALL 命令会列出所有的值