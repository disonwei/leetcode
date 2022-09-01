#
# @lc app=leetcode.cn id=141 lang=python3
#
# [141] 环形链表
#
# https://leetcode.cn/problems/linked-list-cycle/description/
#
# algorithms
# Easy (51.51%)
# Likes:    1602
# Dislikes: 0
# Total Accepted:    831K
# Total Submissions: 1.6M
# Testcase Example:  '[3,2,0,-4]\n1'
#
# 给你一个链表的头节点 head ，判断链表中是否有环。
#
# 如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，评测系统内部使用整数 pos
# 来表示链表尾连接到链表中的位置（索引从 0 开始）。注意：pos 不作为参数进行传递 。仅仅是为了标识链表的实际情况。
#
# 如果链表中存在环 ，则返回 true 。 否则，返回 false 。
#
#
#
# 示例 1：
#
#
#
#
# 输入：head = [3,2,0,-4], pos = 1
# 输出：true
# 解释：链表中有一个环，其尾部连接到第二个节点。
#
#
# 示例 2：
#
#
#
#
# 输入：head = [1,2], pos = 0
# 输出：true
# 解释：链表中有一个环，其尾部连接到第一个节点。
#
#
# 示例 3：
#
#
#
#
# 输入：head = [1], pos = -1
# 输出：false
# 解释：链表中没有环。
#
#
#
#
# 提示：
#
#
# 链表中节点的数目范围是 [0, 10^4]
# -10^5 <= Node.val <= 10^5
# pos 为 -1 或者链表中的一个 有效索引 。
#
#
#
#
# 进阶：你能用 O(1)（即，常量）内存解决此问题吗？
#
#

# @lc code=start
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

# 法1 哈希表
# class Solution:
#     def hasCycle(self, head: Optional[ListNode]) -> bool:
#         hash_set = set()
#         while head:
#             if head in hash_set:
#                 return True
#             hash_set.add(head)
#             head = head.next


# 法2 快慢指针
# 快指针走2步 慢指针走1步
# 有环 快指针会和慢指针相遇
class Solution:
    def hasCycle(self, head: Optional[ListNode]) -> bool:
        if not head or not head.next:
            return False
        slow=head
        fast=head.next
        while slow!=fast:
            if not fast or not fast.next:
                return False
            slow=slow.next
            fast=fast.next.next
        return True


# @lc code=end


"""
快慢指针，顾名思义，是使用速度不同的指针（可用在链表、数组、序列等上面），来解决一些问题。

这些问题主要包括：

处理环上的问题，比如环形链表、环形数组等。
需要知道链表的长度或某个特别位置上的信息的时候。

"""