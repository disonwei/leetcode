--
-- @lc app=leetcode.cn id=1075 lang=mysql
--
-- [1075] 项目员工 I
--
-- https://leetcode.cn/problems/project-employees-i/description/
--
-- database
-- Easy (69.76%)
-- Likes:    21
-- Dislikes: 0
-- Total Accepted:    14.5K
-- Total Submissions: 20.7K
-- Testcase Example:  '{"headers":{"Project":["project_id","employee_id"],"Employee":["employee_id","name","experience_years"]},"rows":{"Project":[[1,1],[1,2],[1,3],[2,1],[2,4]],"Employee":[[1,"Khaled",3],[2,"Ali",2],[3,"John",1],[4,"Doe",2]]}}'
--
-- 项目表 Project： 
-- 
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | project_id  | int     |
-- | employee_id | int     |
-- +-------------+---------+
-- 主键为 (project_id, employee_id)。
-- employee_id 是员工表 Employee 表的外键。
-- 
-- 
-- 员工表 Employee：
-- 
-- 
-- +------------------+---------+
-- | Column Name      | Type    |
-- +------------------+---------+
-- | employee_id      | int     |
-- | name             | varchar |
-- | experience_years | int     |
-- +------------------+---------+
-- 主键是 employee_id。
-- 
-- 
-- 
-- 
-- 请写一个 SQL 语句，查询每一个项目中员工的 平均 工作年限，精确到小数点后两位。
-- 
-- 查询结果的格式如下：
-- 
-- 
-- Project 表：
-- +-------------+-------------+
-- | project_id  | employee_id |
-- +-------------+-------------+
-- | 1           | 1           |
-- | 1           | 2           |
-- | 1           | 3           |
-- | 2           | 1           |
-- | 2           | 4           |
-- +-------------+-------------+
-- 
-- Employee 表：
-- +-------------+--------+------------------+
-- | employee_id | name   | experience_years |
-- +-------------+--------+------------------+
-- | 1           | Khaled | 3                |
-- | 2           | Ali    | 2                |
-- | 3           | John   | 1                |
-- | 4           | Doe    | 2                |
-- +-------------+--------+------------------+
-- 
-- Result 表：
-- +-------------+---------------+
-- | project_id  | average_years |
-- +-------------+---------------+
-- | 1           | 2.00          |
-- | 2           | 2.50          |
-- +-------------+---------------+
-- 第一个项目中，员工的平均工作年限是 (3 + 2 + 1) / 3 = 2.00；第二个项目中，员工的平均工作年限是 (3 + 2) / 2 =
-- 2.50
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below


select p.project_id,round(avg(e.experience_years),2) as average_years
from Project p
inner join Employee e
on p.employee_id=e.employee_id
group by p.project_id


-- @lc code=end


/*
要点:
1. avg 求平均值
2. round 保留小数点 
*/