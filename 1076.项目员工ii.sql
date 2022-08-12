--
-- @lc app=leetcode.cn id=1076 lang=mysql
--
-- [1076] 项目员工II
--
-- https://leetcode.cn/problems/project-employees-ii/description/
--
-- database
-- Easy (49.25%)
-- Likes:    45
-- Dislikes: 0
-- Total Accepted:    15.6K
-- Total Submissions: 31.7K
-- Testcase Example:  '{"headers":{"Project":["project_id","employee_id"],"Employee":["employee_id","name","experience_years"]},"rows":{"Project":[[1,1],[1,2],[1,3],[2,1],[2,4]],"Employee":[[1,"Khaled",3],[2,"Ali",2],[3,"John",1],[4,"Doe",2]]}}'
--
-- Table: Project
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
-- Table: Employee
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
-- 编写一个SQL查询，报告所有雇员最多的项目。
-- 
-- 查询结果格式如下所示：
-- 
-- Project table:
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
-- Employee table:
-- +-------------+--------+------------------+
-- | employee_id | name   | experience_years |
-- +-------------+--------+------------------+
-- | 1           | Khaled | 3                |
-- | 2           | Ali    | 2                |
-- | 3           | John   | 1                |
-- | 4           | Doe    | 2                |
-- +-------------+--------+------------------+
-- 
-- Result table:
-- +-------------+
-- | project_id  |
-- +-------------+
-- | 1           |
-- +-------------+
-- 第一个项目有3名员工，第二个项目有2名员工。
-- 
--

-- @lc code=start
# Write your MySQL query statement below

-- select project_id
-- from (
-- select project_id,count(project_id) as num
-- from Project
-- group by project_id
-- ) as p1
-- where max(p1.num)


-- select project_id
-- from Project p
-- group by project_id
-- having count(*)


select project_id
from Project p
group by project_id
having count(project_id)>=all(
    select count(*)
    from Project p2
    group by p2.project_id
)



-- @lc code=end

/*
all

*/