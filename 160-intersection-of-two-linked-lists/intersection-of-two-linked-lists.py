# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def getIntersectionNode(self, headA: ListNode, headB: ListNode) -> Optional[ListNode]:
        cntA = cntB = 0
        currA = headA
        currB = headB
        while currA is not None:
            cntA += 1
            currA = currA.next
        
        while currB is not None:
            cntB += 1
            currB = currB.next

        if cntA > cntB:
            for _ in range(cntA - cntB):
                headA = headA.next
        else:
            for _ in range(cntB - cntA):
                headB = headB.next
            
        while headA is not None and headB is not None:
            if headA is headB:
                return headA
            headA = headA.next
            headB = headB.next
        