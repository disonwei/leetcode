--
-- @lc app=leetcode.cn id=1113 lang=mysql
--
-- [1113] 报告的记录
--
-- https://leetcode.cn/problems/reported-posts/description/
--
-- database
-- Easy (53.41%)
-- Likes:    25
-- Dislikes: 0
-- Total Accepted:    10.7K
-- Total Submissions: 20K
-- Testcase Example:  '{"headers":{"Actions":["user_id","post_id","action_date","action","extra"]},"rows":{"Actions":[[1,1,"2019-07-01","view",null],[1,1,"2019-07-01","like",null],[1,1,"2019-07-01","share",null],[2,4,"2019-07-04","view",null],[2,4,"2019-07-04","report","spam"],[3,4,"2019-07-04","view",null],[3,4,"2019-07-04","report","spam"],[4,3,"2019-07-02","view",null],[4,3,"2019-07-02","report","spam"],[5,2,"2019-07-04","view",null],[5,2,"2019-07-04","report","racism"],[5,5,"2019-07-04","view",null],[5,5,"2019-07-04","report","racism"]]}}'
--
-- 动作表：Actions
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | user_id       | int     |
-- | post_id       | int     |
-- | action_date   | date    | 
-- | action        | enum    |
-- | extra         | varchar |
-- +---------------+---------+
-- 此表没有主键，所以可能会有重复的行。
-- action 字段是 ENUM 类型的，包含:('view', 'like', 'reaction', 'comment', 'report',
-- 'share')
-- extra 字段是可选的信息（可能为 null），其中的信息例如有：1.报告理由(a reason for report) 2.反应类型(a type
-- of reaction)
-- 
-- 
-- 
-- 
-- 编写一条SQL，查询每种 报告理由（report reason）在昨天的不同报告数量（post_id）。假设今天是 2019-07-05。
-- 
-- 查询及结果的格式示例：
-- 
-- Actions table:
-- +---------+---------+-------------+--------+--------+
-- | user_id | post_id | action_date | action | extra  |
-- +---------+---------+-------------+--------+--------+
-- | 1       | 1       | 2019-07-01  | view   | null   |
-- | 1       | 1       | 2019-07-01  | like   | null   |
-- | 1       | 1       | 2019-07-01  | share  | null   |
-- | 2       | 4       | 2019-07-04  | view   | null   |
-- | 2       | 4       | 2019-07-04  | report | spam   |
-- | 3       | 4       | 2019-07-04  | view   | null   |
-- | 3       | 4       | 2019-07-04  | report | spam   |
-- | 4       | 3       | 2019-07-02  | view   | null   |
-- | 4       | 3       | 2019-07-02  | report | spam   |
-- | 5       | 2       | 2019-07-04  | view   | null   |
-- | 5       | 2       | 2019-07-04  | report | racism |
-- | 5       | 5       | 2019-07-04  | view   | null   |
-- | 5       | 5       | 2019-07-04  | report | racism |
-- +---------+---------+-------------+--------+--------+
-- 
-- Result table:
-- +---------------+--------------+
-- | report_reason | report_count |
-- +---------------+--------------+
-- | spam          | 1            |
-- | racism        | 2            |
-- +---------------+--------------+ 
-- 注意，我们只关心报告数量非零的结果。
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below

-- select extra as resport_reason,sum(post_id) as report_count
-- from Actions
-- group by extra
-- having extra is not null and sum(action_date) = (
--     select action_date
--     from Actions
--     WHERE action_date ="2019-07-04"
-- )


-- select extra as report_reason,count(distinct post_id) as report_count
-- from Actions
-- where action_date="2019-07-04" and extra is not null and action="report"
-- group by extra

select extra as report_reason, count(distinct post_id) as report_count
from actions
where datediff('2019-07-05',action_date) = 1
    and extra is not null
    and action ='report'
group by report_reason;

-- @lc code=end


/*
# datediff

SELECT DATEDIFF('2013-01-13','2012-10-01'); # 104

https://blog.csdn.net/weixin_36450667/article/details/106643957
*/
