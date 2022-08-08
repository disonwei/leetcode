--
-- @lc app=leetcode.cn id=512 lang=mysql
--
-- [512] 游戏玩法分析 II
--
-- https://leetcode.cn/problems/game-play-analysis-ii/description/
--
-- database
-- Easy (54.02%)
-- Likes:    67
-- Dislikes: 0
-- Total Accepted:    28.9K
-- Total Submissions: 53.6K
-- Testcase Example:  '{"headers":{"Activity":["player_id","device_id","event_date","games_played"]},"rows":{"Activity":[[1,2,"2016-03-01",5],[1,2,"2016-05-02",6],[2,3,"2017-06-25",1],[3,1,"2016-03-02",0],[3,4,"2018-07-03",5]]}}'
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
-- (player_id, event_date) 是这个表的两个主键
-- 这个表显示的是某些游戏玩家的游戏活动情况
-- 每一行是在某天使用某个设备登出之前登录并玩多个游戏（可能为0）的玩家的记录
-- 
-- 
-- 请编写一个 SQL 查询，描述每一个玩家首次登陆的设备名称
-- 
-- 查询结果格式在以下示例中：
-- 
-- 
-- Activity table:
-- +-----------+-----------+------------+--------------+
-- | player_id | device_id | event_date | games_played |
-- +-----------+-----------+------------+--------------+
-- | 1         | 2         | 2016-03-01 | 5            |
-- | 1         | 2         | 2016-05-02 | 6            |
-- | 2         | 3         | 2017-06-25 | 1            |
-- | 3         | 1         | 2016-03-02 | 0            |
-- | 3         | 4         | 2018-07-03 | 5            |
-- +-----------+-----------+------------+--------------+
-- 
-- Result table:
-- +-----------+-----------+
-- | player_id | device_id |
-- +-----------+-----------+
-- | 1         | 2         |
-- | 2         | 3         |
-- | 3         | 1         |
-- +-----------+-----------+
-- 
--

-- @lc code=start
# Write your MySQL query statement below

-- select player_id,device_id
-- from Activity
-- group by player_id
-- where 

-- select player_id,device_id
-- from Activity
-- where player_id= (
--     select player_id,min(event_date)
--     from Activity
--     group by player_id
-- )



-- 正解
select player_id,device_id
from Activity
where (player_id,event_date) in (
    select player_id,min(event_date)
    from Activity
    group by player_id
)

/*
考察点：
1. 子查询
2.  in关键字查询匹配多个字段


https://leetcode.cn/problems/game-play-analysis-ii/solution/by-zg104-xt7d/
https://blog.csdn.net/Guanjs2016/article/details/80237490
*/


-- @lc code=end

