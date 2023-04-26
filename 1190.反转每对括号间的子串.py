#
# @lc app=leetcode.cn id=1190 lang=python3
#
# [1190] 反转每对括号间的子串
#
# https://leetcode.cn/problems/reverse-substrings-between-each-pair-of-parentheses/description/
#
# algorithms
# Medium (64.76%)
# Likes:    268
# Dislikes: 0
# Total Accepted:    59.2K
# Total Submissions: 91.5K
# Testcase Example:  '"(abcd)"'
#
# 给出一个字符串 s（仅含有小写英文字母和括号）。
# 
# 请你按照从括号内到外的顺序，逐层反转每对匹配括号中的字符串，并返回最终的结果。
# 
# 注意，您的结果中 不应 包含任何括号。
# 
# 
# 
# 示例 1：
# 
# 
# 输入：s = "(abcd)"
# 输出："dcba"
# 
# 
# 示例 2：
# 
# 
# 输入：s = "(u(love)i)"
# 输出："iloveu"
# 解释：先反转子字符串 "love" ，然后反转整个字符串。
# 
# 示例 3：
# 
# 
# 输入：s = "(ed(et(oc))el)"
# 输出："leetcode"
# 解释：先反转子字符串 "oc" ，接着反转 "etco" ，然后反转整个字符串。
# 
# 示例 4：
# 
# 
# 输入：s = "a(bcdefghijkl(mno)p)q"
# 输出："apmnolkjihgfedcbq"
# 
# 
# 
# 
# 提示：
# 
# 
# 1 <= s.length <= 2000
# s 中只有小写英文字母和括号
# 题目测试用例确保所有括号都是成对出现的
# 
# 
#

# @lc code=start
class Solution:
    def reverseParentheses(self, s: str) -> str:
        stack=[]   # 定义一个栈
        for c in s:  # 遍历字符串
            if c!=")":  # 如果不是右括号  则全部加入到栈中
               stack.append(c) 
            elif c==")":    # 如果遇到右括号
                temp=[]      # 定义一个临时列表   
                while stack and stack[-1]!="(":   # 循环栈，出栈加入到 临时列表中 直到遇到左括号
                    temp.append(stack.pop())
                stack.pop()  # 将左括号出栈
                stack+=temp   # 栈中加入已经翻转的列表
        return "".join(stack)



# @lc code=end
