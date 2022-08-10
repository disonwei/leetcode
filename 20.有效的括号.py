#
# @lc app=leetcode.cn id=20 lang=python3
#
# [20] 有效的括号
#
# https://leetcode.cn/problems/valid-parentheses/description/
#
# algorithms
# Easy (44.64%)
# Likes:    3446
# Dislikes: 0
# Total Accepted:    1.2M
# Total Submissions: 2.7M
# Testcase Example:  '"()"'
#
# 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。
# 
# 有效字符串需满足：
# 
# 
# 左括号必须用相同类型的右括号闭合。
# 左括号必须以正确的顺序闭合。
# 
# 
# 
# 
# 示例 1：
# 
# 
# 输入：s = "()"
# 输出：true
# 
# 
# 示例 2：
# 
# 
# 输入：s = "()[]{}"
# 输出：true
# 
# 
# 示例 3：
# 
# 
# 输入：s = "(]"
# 输出：false
# 
# 
# 示例 4：
# 
# 
# 输入：s = "([)]"
# 输出：false
# 
# 
# 示例 5：
# 
# 
# 输入：s = "{[]}"
# 输出：true
# 
# 
# 
# 提示：
# 
# 
# 1 
# s 仅由括号 '()[]{}' 组成
# 
# 
#

# @lc code=start
# class Solution:
#     def isValid(self, s: str) -> bool:
#         stack=[]
#         for i in s:
#             left=["(","[","{"]
#             right=[")","]","}"]
#             if i in left:
#                 stack.append(i)
#             if i in right:
#                 if len(stack)==0:
#                     return False
                
#                 stack_top=stack.pop()
#                 if stack_top=="(" and i==")":
#                     continue
#                 if stack_top=="[" and i=="]":
#                     continue
#                 if stack_top=="{" and i=="}":
#                     continue
#                 # if stack_top==i:
#                 #     continue
#                 else:
#                     return False
#         if len(stack):
#             return False
#         else:
#             return True



# 官方

class Solution:
    def isValid(self, s: str) -> bool:
        hash_dict={
            "(":")",
            "[":"]",
            "{":"}"
        }
        stack_list=list()
        
        for i in s:
            if i in hash_dict:
                stack_list.append(i)
            else:
                if not stack_list or hash_dict[stack_list[-1]]!=i:
                    return False
                stack_list.pop()
        return not stack_list





# @lc code=end

# 要点：
# 1. 栈
# 2. 哈希表


# 总结
# 1. 栈 - 列表模拟  进栈append  出栈 pop
# 2. 哈希表 - 字典  key  value
# 3. 字典   in 遍历 字典 遍历的是key