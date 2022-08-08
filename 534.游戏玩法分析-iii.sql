--
-- @lc app=leetcode.cn id=534 lang=mysql
--
-- [534] 游戏玩法分析 III
--
-- https://leetcode.cn/problems/game-play-analysis-iii/description/
--
-- database
-- Medium (68.13%)
-- Likes:    85
-- Dislikes: 0
-- Total Accepted:    23.2K
-- Total Submissions: 34.1K
-- Testcase Example:  '{"headers":{"Activity":["player_id","device_id","event_date","games_played"]},"rows":{"Activity":[[1,2,"2016-03-01",5],[1,2,"2016-05-02",6],[1,3,"2017-06-25",1],[3,1,"2016-03-02",0],[3,4,"2018-07-03",5]]}}'
--
-- Table: Activity
-- 
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
-- 每一行是一个玩家的记录，他在某一天使用某个设备注销之前登录并玩了很多游戏（可能是 0 ）。
-- 
-- 
-- 
-- 
-- 编写一个 SQL 查询，同时报告每组玩家和日期，以及玩家到目前为止玩了多少游戏。也就是说，在此日期之前玩家所玩的游戏总数。详细情况请查看示例。
-- 
-- 查询结果格式如下所示：
-- 
-- 
-- Activity table:
-- +-----------+-----------+------------+--------------+
-- | player_id | device_id | event_date | games_played |
-- +-----------+-----------+------------+--------------+
-- | 1         | 2         | 2016-03-01 | 5            |
-- | 1         | 2         | 2016-05-02 | 6            |
-- | 1         | 3         | 2017-06-25 | 1            |
-- | 3         | 1         | 2016-03-02 | 0            |
-- | 3         | 4         | 2018-07-03 | 5            |
-- +-----------+-----------+------------+--------------+
-- 
-- Result table:
-- +-----------+------------+---------------------+
-- | player_id | event_date | games_played_so_far |
-- +-----------+------------+---------------------+
-- | 1         | 2016-03-01 | 5                   |
-- | 1         | 2016-05-02 | 11                  |
-- | 1         | 2017-06-25 | 12                  |
-- | 3         | 2016-03-02 | 0                   |
-- | 3         | 2018-07-03 | 5                   |
-- +-----------+------------+---------------------+
-- 对于 ID 为 1 的玩家，2016-05-02 共玩了 5+6=11 个游戏，2017-06-25 共玩了 5+6+1=12 个游戏。
-- 对于 ID 为 3 的玩家，2018-07-03 共玩了 0+5=5 个游戏。
-- 请注意，对于每个玩家，我们只关心玩家的登录日期。
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below


-- select player_id,event_date,games_played_so_far
-- from Activity


-- select player_id,sum(event_date) as games_played_so_far
-- from Activity
-- group by player_id



-- select t1.player_id,t1.event_date,sum(t2.games_played) as games_played_so_far
-- from Activity t1
-- inner join Activity t2 on t1.player_id=t2.player_id and t1.event_date>=t2.event_date
-- group by t1.player_id,t1.event_date


-- select a.player_id,b.event_date,sum(a.games_played) as games_played_so_far
-- from Activity a
-- inner join Activity b on a.player_id=b.player_id and a.event_date<=b.event_date
-- group by b.player_id,b.event_date;



select  t1.player_id,
        t1.event_date,
        sum(t2.games_played) games_played_so_far
from    Activity t1,
        Activity t2
where   t1.player_id=t2.player_id
and     t1.event_date>=t2.event_date
group by t1.player_id,t1.event_date


-- select t1.player_id,
--        t1.event_date,
--        sum(t2.games_played) games_played_so_far
-- from Activity t1,Activity t2
-- where t1.player_id=t2.player_id
--   and t1.event_date>=t2.event_date
-- group by t1.player_id,t1.event_date;



-- @lc code=end


/*
考察点：
1. 自连接

https://leetcode.cn/problems/game-play-analysis-iii/solution/chao-xiang-xi-tu-jie-zi-lian-jie-by-piajun/

https://www.w3school.com.cn/sql/sql_join_inner.asp
*/