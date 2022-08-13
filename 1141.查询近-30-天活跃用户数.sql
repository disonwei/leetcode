--
-- @lc app=leetcode.cn id=1141 lang=mysql
--
-- [1141] 查询近30天活跃用户数
--
-- https://leetcode.cn/problems/user-activity-for-the-past-30-days-i/description/
--
-- database
-- Easy (46.24%)
-- Likes:    51
-- Dislikes: 0
-- Total Accepted:    28.8K
-- Total Submissions: 62.3K
-- Testcase Example:  '{"headers":{"Activity":["user_id","session_id","activity_date","activity_type"]},"rows":{"Activity":[[1,1,"2019-07-20","open_session"],[1,1,"2019-07-20","scroll_down"],[1,1,"2019-07-20","end_session"],[2,4,"2019-07-20","open_session"],[2,4,"2019-07-21","send_message"],[2,4,"2019-07-21","end_session"],[3,2,"2019-07-21","open_session"],[3,2,"2019-07-21","send_message"],[3,2,"2019-07-21","end_session"],[4,3,"2019-06-25","open_session"],[4,3,"2019-06-25","end_session"]]}}'
--
-- 活动记录表：Activity
-- 
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | user_id       | int     |
-- | session_id    | int     |
-- | activity_date | date    |
-- | activity_type | enum    |
-- +---------------+---------+
-- 该表是用户在社交网站的活动记录。
-- 该表没有主键，可能包含重复数据。
-- activity_type 字段为以下四种值 ('open_session', 'end_session', 'scroll_down',
-- 'send_message')。
-- 每个 session_id 只属于一个用户。
-- 
-- 
-- 
-- 
-- 请写SQL查询出截至 2019-07-27（包含2019-07-27），近 30 天的每日活跃用户数（当天只要有一条活动记录，即为活跃用户）。
-- 
-- 以 任意顺序 返回结果表。
-- 
-- 查询结果示例如下。
-- 
-- 
-- 
-- 示例 1:
-- 
-- 
-- 输入：
-- Activity table:
-- +---------+------------+---------------+---------------+
-- | user_id | session_id | activity_date | activity_type |
-- +---------+------------+---------------+---------------+
-- | 1       | 1          | 2019-07-20    | open_session  |
-- | 1       | 1          | 2019-07-20    | scroll_down   |
-- | 1       | 1          | 2019-07-20    | end_session   |
-- | 2       | 4          | 2019-07-20    | open_session  |
-- | 2       | 4          | 2019-07-21    | send_message  |
-- | 2       | 4          | 2019-07-21    | end_session   |
-- | 3       | 2          | 2019-07-21    | open_session  |
-- | 3       | 2          | 2019-07-21    | send_message  |
-- | 3       | 2          | 2019-07-21    | end_session   |
-- | 4       | 3          | 2019-06-25    | open_session  |
-- | 4       | 3          | 2019-06-25    | end_session   |
-- +---------+------------+---------------+---------------+
-- 输出：
-- +------------+--------------+ 
-- | day        | active_users |
-- +------------+--------------+ 
-- | 2019-07-20 | 2            |
-- | 2019-07-21 | 2            |
-- +------------+--------------+ 
-- 解释：注意非活跃用户的记录不需要展示。
-- 
--

-- @lc code=start
# Write your MySQL query statement below

-- select activity_date as day,count(distinct user_id) as active_users
-- from Activity
-- where datediff("2019-07-27",activity_date)<30
-- group by activity_date


select activity_date as day,count(distinct user_id) as active_users
from Activity
where datediff("2019-07-27",activity_date)<30 and datediff('2019-07-27', activity_date) >= 0
group by activity_date

-- @lc code=end

/*

总结

只要题目没说明给出的日期是有所包含的,加上等号,否则去掉等号
题目给出较模糊的时间边界，如一年，一月，直接写日期而不是计算时间间隔(<,>,<=,>=)
同理，给出了准确的时间间隔，不要去计算到底是哪一天，直接使用时间间隔进行判断（datediff,date_add,date_sub）


题外话

在编写用户类型的题目时，注意观察题目给出的表是否设计主键，是否存在重复，记得加上distinct
日期在比较时，需要在时间上加上引号
*/