--
-- @lc app=leetcode.cn id=550 lang=mysql
--
-- [550] 游戏玩法分析 IV
--
-- https://leetcode.cn/problems/game-play-analysis-iv/description/
--
-- database
-- Medium (43.99%)
-- Likes:    84
-- Dislikes: 0
-- Total Accepted:    21.1K
-- Total Submissions: 47.9K
-- Testcase Example:  '{"headers":{"Activity":["player_id","device_id","event_date","games_played"]},"rows":{"Activity":[[1,2,"2016-03-01",5],[1,2,"2016-03-02",6],[2,3,"2017-06-25",1],[3,1,"2016-03-02",0],[3,4,"2018-07-03",5]]}}'
--
-- Table: Activity
-- 
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | player_id    | int     |
-- | device_id    | int     |
-- | event_date   | date    |
-- | games_played | int     |
-- +--------------+---------+
-- （player_id，event_date）是此表的主键。
-- 这张表显示了某些游戏的玩家的活动情况。
-- 每一行是一个玩家的记录，他在某一天使用某个设备注销之前登录并玩了很多游戏（可能是 0）。
-- 
-- 
-- 
-- 
-- 编写一个 SQL
-- 查询，报告在首次登录的第二天再次登录的玩家的比率，四舍五入到小数点后两位。换句话说，您需要计算从首次登录日期开始至少连续两天登录的玩家的数量，然后除以玩家总数。
-- 
-- 查询结果格式如下所示：
-- 
-- Activity table:
-- +-----------+-----------+------------+--------------+
-- | player_id | device_id | event_date | games_played |
-- +-----------+-----------+------------+--------------+
-- | 1         | 2         | 2016-03-01 | 5            |
-- | 1         | 2         | 2016-03-02 | 6            |
-- | 2         | 3         | 2017-06-25 | 1            |
-- | 3         | 1         | 2016-03-02 | 0            |
-- | 3         | 4         | 2018-07-03 | 5            |
-- +-----------+-----------+------------+--------------+
-- 
-- Result table:
-- +-----------+
-- | fraction  |
-- +-----------+
-- | 0.33      |
-- +-----------+
-- 只有 ID 为 1 的玩家在第一天登录后才重新登录，所以答案是 1/3 = 0.33
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below

-- select distinct *
-- from Activity a1
-- inner join Activity a2
-- on a1.event_date-a2.event_date=-1
-- -- on diffdate(a1.event_date,a2.event_date)=1 

-- --  总人数
-- select distinct count(*)
-- from Activity
-- -- group by player_id

-- select (
--     select count(*)
--     from Activity a1
--     inner join Activity a2
--     on a1.event_date-a2.event_date=1


-- )/(
--     select count(*)
--     from Activity
--     group by player_id
-- )

--  查询首次登录的用户
-- select player_id,min(event_date)
-- from Activity
-- group by player_id

-- 左关联查询
select round(sum(if (a2.event_date is not null ,1,0))/count(*),2) as fraction
-- select *
from (
select player_id,min(event_date) as event_date
from Activity
group by player_id
) a1
left join Activity a2
on a1.player_id=a2.player_id and datediff(a2.event_date,a1.event_date)=1

-- select *
-- select round(avg(a.event_date is not null), 2) fraction
-- from 
--     (select player_id, min(event_date) as login
--     from activity
--     group by player_id) p 
-- left join activity a 
-- on p.player_id=a.player_id and datediff(a.event_date, p.login)=1

-- @lc code=end

/*
思路：
先查出用户首次登录日期
左关联查询 根据player_id 以及 datediff
计算比率：
sum(if (a2.event_date is not null ,1,0))/count(*)

avg(a2.event_date is not null)：
is not null判断后，有eventdate值的返回1，null的返回0，
avg相当于求和后(即符合条件的id个数)除以总id数即所求比例
*/