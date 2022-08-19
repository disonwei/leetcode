--
-- @lc app=leetcode.cn id=570 lang=mysql
--
-- [570] 至少有5名直接下属的经理
--
-- https://leetcode.cn/problems/managers-with-at-least-5-direct-reports/description/
--
-- database
-- Medium (65.59%)
-- Likes:    39
-- Dislikes: 0
-- Total Accepted:    22.4K
-- Total Submissions: 34.2K
-- Testcase Example:  '{"headers": {"Employee": ["Id", "Name", "Department", "ManagerId"]}, "rows": {"Employee": [[101, "John", "A", null],[102, "Dan", "A", 101], [103, "James", "A", 101], [104, "Amy", "A", 101], [105, "Anne", "A", 101], [106, "Ron", "B", 101]]}}'
--
-- 表: Employee
-- 
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | department  | varchar |
-- | managerId   | int     |
-- +-------------+---------+
-- Id是该表的主键列。
-- 该表的每一行都表示雇员的名字、他们的部门和他们的经理的id。
-- 如果managerId为空，则该员工没有经理。
-- 没有员工会成为自己的管理者。
-- 
-- 
-- 
-- 
-- 编写一个SQL查询，查询至少有5名直接下属的经理 。
-- 
-- 以 任意顺序 返回结果表。
-- 
-- 查询结果格式如下所示。
-- 
-- 
-- 
-- 示例 1:
-- 
-- 
-- 输入: 
-- Employee 表:
-- +-----+-------+------------+-----------+
-- | id  | name  | department | managerId |
-- +-----+-------+------------+-----------+
-- | 101 | John  | A          | None      |
-- | 102 | Dan   | A          | 101       |
-- | 103 | James | A          | 101       |
-- | 104 | Amy   | A          | 101       |
-- | 105 | Anne  | A          | 101       |
-- | 106 | Ron   | B          | 101       |
-- +-----+-------+------------+-----------+
-- 输出: 
-- +------+
-- | name |
-- +------+
-- | John |
-- +------+
-- 
--

-- @lc code=start
# Write your MySQL query statement below

-- select managerId
-- from Employee
-- group by managerId
-- having count(*)>=5 and managerId is not null


select e1.name as name
from Employee e1
where e1.id in (
select managerId
from Employee
group by managerId
having count(*)>=5 and managerId is not null
)
-- @lc code=end
/*
思路：

1. 根据managerId 分组 刷选出总数大于5的 managerId
2. 在 Employee 表中查询这些managerid

*/
