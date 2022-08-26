--
-- @lc app=leetcode.cn id=580 lang=mysql
--
-- [580] 统计各专业学生人数
--
-- https://leetcode.cn/problems/count-student-number-in-departments/description/
--
-- database
-- Medium (52.71%)
-- Likes:    53
-- Dislikes: 0
-- Total Accepted:    18.2K
-- Total Submissions: 34.5K
-- Testcase Example:  '{"headers":{"Student":["student_id","student_name","gender","dept_id"],"Department":["dept_id","dept_name"]},"rows":{"Student":[[1,"Jack","M",1],[2,"Jane","F",1],[3,"Mark","M",2]],"Department":[[1,"Engineering"],[2,"Science"],[3,"Law"]]}}'
--
-- 表: Student
-- 
-- 
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | student_id   | int     |
-- | student_name | varchar |
-- | gender       | varchar |
-- | dept_id      | int     |
-- +--------------+---------+
-- Student_id是该表的主键。
-- dept_id是Department表中dept_id的外键。
-- 该表的每一行都表示学生的姓名、性别和所属系的id。
-- 
-- 
-- 
-- 
-- 表: Department
-- 
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | dept_id     | int     |
-- | dept_name   | varchar |
-- +-------------+---------+
-- Dept_id是该表的主键。
-- 该表的每一行包含一个部门的id和名称。
-- 
-- 
-- 
-- 编写一个SQL查询，为 Department 表中的所有部门(甚至是没有当前学生的部门)报告各自的部门名称和每个部门的学生人数。
-- 
-- 按 student_number 降序 返回结果表。如果是平局，则按 dept_name 的  字母顺序 排序。
-- 
-- 查询结果格式如下所示。
-- 
-- 
-- 
-- 示例 1:
-- 
-- 
-- 输入: 
-- Student 表:
-- +------------+--------------+--------+---------+
-- | student_id | student_name | gender | dept_id |
-- +------------+--------------+--------+---------+
-- | 1          | Jack         | M      | 1       |
-- | 2          | Jane         | F      | 1       |
-- | 3          | Mark         | M      | 2       |
-- +------------+--------------+--------+---------+
-- Department 表:
-- +---------+-------------+
-- | dept_id | dept_name   |
-- +---------+-------------+
-- | 1       | Engineering |
-- | 2       | Science     |
-- | 3       | Law         |
-- +---------+-------------+
-- 输出: 
-- +-------------+----------------+
-- | dept_name   | student_number |
-- +-------------+----------------+
-- | Engineering | 2              |
-- | Science     | 1              |
-- | Law         | 0              |
-- +-------------+----------------+
-- 
--

-- @lc code=start
# Write your MySQL query statement below

--  解法1  左关联 查询 
--  count 处理 null 时的问题
--  count(*) 计算的是总行数，不会忽略 null ，
--  但是这里有些专业没有人，计算出来应该是 0 ，所以应该使用 count(student_id)
--  count(*)
--  count(student_id)
--  我们可以使用 COUNT(expression) 语句，因为如果 expression is null，那么这条记录不会被计数。

-- select d1.dept_name,count(student_id) as student_number
-- from Department d1
-- left join Student s1
-- on s1.dept_id=d1.dept_id
-- group by d1.dept_id
-- order by student_number DESC




-- 解法2 子查询 关联查询

-- select dept_id,count(*) student_number
-- from Student
-- group by dept_id


-- case when 使用
-- case when a.num is not null then a.num else 0 end as student_number

select d1.dept_name,case when s1.student_number is not null then s1.student_number else 0 end as student_number
from Department d1
left join (
    select dept_id,count(*) student_number
from Student
group by dept_id
) s1
on s1.dept_id=d1.dept_id
order by student_number DESC

-- @lc code=end

-- 
