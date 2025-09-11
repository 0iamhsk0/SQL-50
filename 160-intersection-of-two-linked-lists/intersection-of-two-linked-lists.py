# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def getIntersectionNode(self, headA: ListNode, headB: ListNode) -> Optional[ListNode]:        # Count lengths
        cntA, cntB = 0, 0
        currA, currB = headA, headB
        while currA:
            cntA += 1
            currA = currA.next
        while currB:
            cntB += 1
            currB = currB.next

        # Align pointers
        while cntA > cntB:
            headA = headA.next
            cntA -= 1
        while cntB > cntA:
            headB = headB.next
            cntB -= 1

        # Move together and check for intersection
        while headA and headB:
            if headA is headB:
                return headA
            headA = headA.next
            headB = headB.next
        return None
        