#
# @lc app=leetcode.cn id=94 lang=python3
#
# [94] 二叉树的中序遍历
#
# https://leetcode.cn/problems/binary-tree-inorder-traversal/description/
#
# algorithms
# Easy (76.10%)
# Likes:    1538
# Dislikes: 0
# Total Accepted:    931.7K
# Total Submissions: 1.2M
# Testcase Example:  '[1,null,2,3]'
#
# 给定一个二叉树的根节点 root ，返回 它的 中序 遍历 。
#
#
#
# 示例 1：
#
#
# 输入：root = [1,null,2,3]
# 输出：[1,3,2]
#
#
# 示例 2：
#
#
# 输入：root = []
# 输出：[]
#
#
# 示例 3：
#
#
# 输入：root = [1]
# 输出：[1]
#
#
#
#
# 提示：
#
#
# 树中节点数目在范围 [0, 100] 内
# -100 <= Node.val <= 100
#
#
#
#
# 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
#
#

# @lc code=start
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right

# class Solution:
#     alist = []

#     def inorderTraversal(self, root: Optional[TreeNode]) -> List[int]:

# print(root.left)
# if not root.left or not root.right:
#     return self.alist.append(root.val)

# if root.left:
#     return self.inorderTraversal(root.left)
# if root.right:
#     return self.inorderTraversal(root.right)


# 前中后 通用版  递归
# class Solution:
#     def inorderTraversal(self, root: Optional[TreeNode]) -> List[int]:

#         def dfs(cur):
#             if not cur:
#                 return
#             # 前序递归
#             # res.append(cur.val)
#             # dfs(cur.left)
#             # dfs(cur.right)
#             # # 中序递归
#             dfs(cur.left)
#             res.append(cur.val)
#             dfs(cur.right)
#             # # 后序递归
#             # dfs(cur.left)
#             # dfs(cur.right)
#             # res.append(cur.val)

#         res = []
#         dfs(root)
#         return res


# 迭代 前中 后 通用  栈
class Solution:
    def inorderTraversal(self, root: Optional[TreeNode]) -> List[int]:
        stack = []
        res = []
        cur = root
         # 中序，模板：先用指针找到每颗子树的最左下角，然后进行进出栈操作
        while stack or cur:
            while cur:
                stack.append(cur)
                cur = cur.left
            cur = stack.pop()
            res.append(cur.val)
            cur = cur.right
        return res

        # # 前序，相同模板
        # while stack or cur:
        #     while cur:
        #         res.append(cur.val)
        #         stack.append(cur)
        #         cur = cur.left
        #     cur = stack.pop()
        #     cur = cur.right
        # return res
        
        # # 后序，相同模板
        # while stack or cur:
        #     while cur:
        #         res.append(cur.val)
        #         stack.append(cur)
        #         cur = cur.right
        #     cur = stack.pop()
        #     cur = cur.left
        # return res[::-1]

# @lc code=end

# 中序 left root right
"""             0
  1             i   
2   3          2i+1  2i+2
4 5 6 7         

"""
