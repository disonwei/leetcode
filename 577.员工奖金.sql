--
-- @lc app=leetcode.cn id=577 lang=mysql
--
-- [577] 员工奖金
--
-- https://leetcode.cn/problems/employee-bonus/description/
--
-- database
-- Easy (69.23%)
-- Likes:    33
-- Dislikes: 0
-- Total Accepted:    24.2K
-- Total Submissions: 35K
-- Testcase Example:  '{"headers":{"Employee":["empId","name","supervisor","salary"],"Bonus":["empId","bonus"]},"rows":{"Employee":[[3,"Brad",null,4000],[1,"John",3,1000],[2,"Dan",3,2000],[4,"Thomas",3,4000]],"Bonus":[[2,500],[4,2000]]}}'
--
-- 选出所有 bonus < 1000 的员工的 name 及其 bonus。
-- 
-- Employee 表单
-- 
-- +-------+--------+-----------+--------+
-- | empId |  name  | supervisor| salary |
-- +-------+--------+-----------+--------+
-- |   1   | John   |  3        | 1000   |
-- |   2   | Dan    |  3        | 2000   |
-- |   3   | Brad   |  null     | 4000   |
-- |   4   | Thomas |  3        | 4000   |
-- +-------+--------+-----------+--------+
-- empId 是这张表单的主关键字
-- 
-- 
-- Bonus 表单
-- 
-- +-------+-------+
-- | empId | bonus |
-- +-------+-------+
-- | 2     | 500   |
-- | 4     | 2000  |
-- +-------+-------+
-- empId 是这张表单的主关键字
-- 
-- 
-- 输出示例：
-- 
-- +-------+-------+
-- | name  | bonus |
-- +-------+-------+
-- | John  | null  |
-- | Dan   | 500   |
-- | Brad  | null  |
-- +-------+-------+
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below

-- select e.name,b.bonus
-- from Employee e
-- left join Bonus b on b.empId=e.empId and b.bonus<1000


-- select e.name,b.bonus
-- from Employee e,Bonus b
-- where e.empId=b.empId and b.bonus<1000


select e.name,b.bonus
from Employee e
left join Bonus b on b.empId=e.empId
where b.bonus is null or b.bonus<1000

/*
考察点 
1.左连接 
2. 联表查询
3. null 比较  is null is not null

https://blog.csdn.net/qq_38992887/article/details/124499386

*/

-- @lc code=end

