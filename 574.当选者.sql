--
-- @lc app=leetcode.cn id=574 lang=mysql
--
-- [574] 当选者
--
-- https://leetcode.cn/problems/winning-candidate/description/
--
-- database
-- Medium (66.18%)
-- Likes:    38
-- Dislikes: 0
-- Total Accepted:    19.9K
-- Total Submissions: 30K
-- Testcase Example:  '{"headers":{"Candidate":["id","Name"],"Vote":["id","CandidateId"]},"rows":{"Candidate":[[1,"A"],[2,"B"],[3,"C"],[4,"D"],[5,"E"]],"Vote":[[1,2],[2,4],[3,3],[4,2],[5,5]]}}'
--
-- 表: Candidate
-- 
-- 
-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | id          | int      |
-- | name        | varchar  |
-- +-------------+----------+
-- Id是该表的主键列。
-- 该表的每一行都包含关于候选对象的id和名称的信息。
-- 
-- 
-- 
-- 表: Vote
-- 
-- 
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | candidateId | int  |
-- +-------------+------+
-- Id是自动递增的主键。
-- candidateId是id来自Candidate表的外键。
-- 该表的每一行决定了在选举中获得第i张选票的候选人。
-- 
-- 
-- 
-- 编写一个SQL查询来报告获胜候选人的名字(即获得最多选票的候选人)。
-- 
-- 生成测试用例以确保 只有一个候选人赢得选举。
-- 
-- 查询结果格式如下所示。
-- 
-- 
-- 
-- 示例 1:
-- 
-- 
-- 输入: 
-- Candidate table:
-- +----+------+
-- | id | name |
-- +----+------+
-- | 1  | A    |
-- | 2  | B    |
-- | 3  | C    |
-- | 4  | D    |
-- | 5  | E    |
-- +----+------+
-- Vote table:
-- +----+-------------+
-- | id | candidateId |
-- +----+-------------+
-- | 1  | 2           |
-- | 2  | 4           |
-- | 3  | 3           |
-- | 4  | 2           |
-- | 5  | 5           |
-- +----+-------------+
-- 输出: 
-- +------+
-- | name |
-- +------+
-- | B    |
-- +------+
-- 解释: 
-- 候选人B有2票。候选人C、D、E各有1票。
-- 获胜者是候选人B。
-- 
--

-- @lc code=start
# Write your MySQL query statement below


select name 
from Candidate c
inner join Vote v
on v.candidateId=c.id
group by v.candidateId
order by count(v.candidateId) desc
limit 1


-- select name
-- from Candidate c
-- where c.id in(
--     select candidateId
--     from Vote
--     group by candidateId
--     order by count(candidateId)
--     limit 1
-- )

-- @lc code=end

