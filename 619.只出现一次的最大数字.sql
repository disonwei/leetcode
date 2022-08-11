--
-- @lc app=leetcode.cn id=619 lang=mysql
--
-- [619] 只出现一次的最大数字
--
-- https://leetcode.cn/problems/biggest-single-number/description/
--
-- database
-- Easy (46.26%)
-- Likes:    42
-- Dislikes: 0
-- Total Accepted:    18.9K
-- Total Submissions: 40.7K
-- Testcase Example:  '{"headers": {"MyNumbers": ["num"]}, "rows": {"MyNumbers": [[8],[8],[3],[3],[1],[4],[5],[6]]}}'
--
-- MyNumbers 表：
-- 
-- 
-- 
-- 
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | num         | int  |
-- +-------------+------+
-- 这张表没有主键。可能包含重复数字。
-- 这张表的每一行都含有一个整数。
-- 
-- 
-- 
-- 
-- 单一数字 是在 MyNumbers 表中只出现一次的数字。
-- 
-- 请你编写一个 SQL 查询来报告最大的 单一数字 。如果不存在 单一数字 ，查询需报告 null 。
-- 
-- 查询结果如下例所示。
-- ⁠
-- 
-- 
-- 
-- 示例 1：
-- 
-- 
-- 输入：
-- MyNumbers 表：
-- +-----+
-- | num |
-- +-----+
-- | 8   |
-- | 8   |
-- | 3   |
-- | 3   |
-- | 1   |
-- | 4   |
-- | 5   |
-- | 6   |
-- +-----+
-- 输出：
-- +-----+
-- | num |
-- +-----+
-- | 6   |
-- +-----+
-- 解释：单一数字有 1、4、5 和 6 。
-- 6 是最大的单一数字，返回 6 。
-- 
-- 
-- 示例 2：
-- 
-- 
-- 输入：
-- MyNumbers table:
-- +-----+
-- | num |
-- +-----+
-- | 8   |
-- | 8   |
-- | 7   |
-- | 7   |
-- | 3   |
-- | 3   |
-- | 3   |
-- +-----+
-- 输出：
-- +------+
-- | num  |
-- +------+
-- | null |
-- +------+
-- 解释：输入的表中不存在单一数字，所以返回 null 。
-- 
-- 
-- 
-- 
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below

-- 内连接 
-- 查询出单一数据
-- 取出最大数据

-- select max(n1.num)
-- from (
-- select distinct n1.num
-- from MyNumbers n1
-- inner join MyNumbers n2
-- where n1.num !=n2.num
-- )

-- select n1.num,n2.num
-- from MyNumbers n1
-- inner join MyNumbers n2
-- where n1.num !=n2.num


-- select max(n1.num)
-- from MyNumbers n1
-- inner join MyNumbers n2
-- when n1.num !=n2.num

--  子查询 查询出具有重复的字段
-- select num
-- from MyNumbers
-- group by num
-- having count(*)>=2


-- select max(num) as num
-- from MyNumbers
-- where num not in (
--     select num
-- from MyNumbers
-- group by num
-- having count(*)>=2
-- )


-- 方法2 错误  null  问题
-- select num
-- from MyNumbers
-- group by num
-- having count(*)=1
-- order by num DESC
-- limit 1


-- 方法3
select 
 (
    select num
    from MyNumbers
    group by num
    having count(*)=1
    order by num DESC
    limit 1
) as num


-- @lc code=end

/*
考察点:
1. 子查询
2. 分组 筛选
3. count(*)
4. max

1. null 值问题 
https://leetcode.cn/problems/biggest-single-number/solution/dang-biao-ge-wei-kong-shi-ru-he-fan-hui-6qpzg/
*/