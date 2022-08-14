--
-- @lc app=leetcode.cn id=1241 lang=mysql
--
-- [1241] 每个帖子的评论数
--
-- https://leetcode.cn/problems/number-of-comments-per-post/description/
--
-- database
-- Easy (59.40%)
-- Likes:    44
-- Dislikes: 0
-- Total Accepted:    9.6K
-- Total Submissions: 16.1K
-- Testcase Example:  '{"headers":{"Submissions":["sub_id","parent_id"]},"rows":{"Submissions":[[1,null],[2,null],[1,null],[12,null],[3,1],[5,2],[3,1],[4,1],[9,1],[10,2],[6,7]]}}'
--
-- 表 Submissions 结构如下：
-- 
-- 
-- +---------------+----------+
-- | 列名           | 类型     |
-- +---------------+----------+
-- | sub_id        | int      |
-- | parent_id     | int      |
-- +---------------+----------+
-- 上表没有主键, 所以可能会出现重复的行。
-- 每行可以是一个帖子或对该帖子的评论。
-- 如果是帖子的话，parent_id 就是 null。
-- 对于评论来说，parent_id 就是表中对应帖子的 sub_id。
-- 
-- 
-- 
-- 
-- 编写 SQL 语句以查找每个帖子的评论数。
-- 
-- 结果表应包含帖子的 post_id 和对应的评论数 number_of_comments 并且按 post_id 升序排列。
-- 
-- Submissions 可能包含重复的评论。您应该计算每个帖子的唯一评论数。
-- 
-- Submissions 可能包含重复的帖子。您应该将它们视为一个帖子。
-- 
-- 结果表应该按 post_id 升序排序。
-- 
-- 查询结果格式如下例所示。
-- 
-- 
-- 
-- 示例 1:
-- 
-- 
-- 输入：
-- Submissions table:
-- +---------+------------+
-- | sub_id  | parent_id  |
-- +---------+------------+
-- | 1       | Null       |
-- | 2       | Null       |
-- | 1       | Null       |
-- | 12      | Null       |
-- | 3       | 1          |
-- | 5       | 2          |
-- | 3       | 1          |
-- | 4       | 1          |
-- | 9       | 1          |
-- | 10      | 2          |
-- | 6       | 7          |
-- +---------+------------+
-- 输出：
-- +---------+--------------------+
-- | post_id | number_of_comments |
-- +---------+--------------------+
-- | 1       | 3                  |
-- | 2       | 2                  |
-- | 12      | 0                  |
-- +---------+--------------------+
-- 解释：
-- 表中 ID 为 1 的帖子有 ID 为 3、4 和 9 的三个评论。表中 ID 为 3 的评论重复出现了，所以我们只对它进行了一次计数。
-- 表中 ID 为 2 的帖子有 ID 为 5 和 10 的两个评论。
-- ID 为 12 的帖子在表中没有评论。
-- 表中 ID 为 6 的评论是对 ID 为 7 的已删除帖子的评论，因此我们将其忽略。
-- 
--

-- @lc code=start
# Write your MySQL query statement below

-- select post_id,number_of_comments
-- from Submissions

-- select (
-- select distinct sub_id
-- from Submissions
-- where parent_id is null
-- order by sub_id
-- ) as post_id,
-- (select distinct count(parent_id)
-- from Submissions
-- where parent_id is not null
-- group by parent_id
-- order by parent_id
-- ) as number_of_comments



-- select parent_id as post_id,s1.count_ as number_of_comments
-- from Submissions
-- where parent_id is null and parent_id in (
-- select parent_id,count(parent_id) as count_
-- from Submissions
-- where parent_id is not null
-- group by parent_id
-- ) as s1


-- select s1.sub_id,count(*) as number_of_comments
-- from Submissions s1
-- inner join Submissions s2
-- on s1.sub_id=s2.parent_id and s1.parent_id is null and s2.parent_id is not null
-- group by s1.sub_id


select s1.sub_id as post_id,count(distinct s2.sub_id) as number_of_comments
from Submissions s1
left join Submissions s2
on s1.sub_id=s2.parent_id
where s1.parent_id is null
group by s1.sub_id
order by s1.sub_id



-- @lc code=end

/*
count(distinct s2.sub_id)
根据 s2 的sub_id 去重

左连接
筛选出帖子
根据帖子分组
*/