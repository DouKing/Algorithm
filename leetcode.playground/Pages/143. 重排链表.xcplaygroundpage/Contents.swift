//: [Previous](@previous)
/**
给定一个单链表 L：L0→L1→…→Ln-1→Ln ，
将其重新排列后变为： L0→Ln→L1→Ln-1→L2→Ln-2→…

你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。

示例 1:

给定链表 1->2->3->4, 重新排列为 1->4->2->3.
示例 2:

给定链表 1->2->3->4->5, 重新排列为 1->5->2->4->3.

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/reorder-list
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/
import Foundation

class Solution {
	func reorderList(_ head: ListNode?) {
		guard let head = head else { return }
		var list: [ListNode] = []

		var node: ListNode? = head
		while let n = node {
			list.append(n)
			node = n.next
		}

		var i = 0, j = list.count - 1
		while i < j {
			list[i].next = list[j]
			i += 1
			if i == j {
				break
			}
			list[j].next = list[i]
			j -= 1
		}
		list[i].next = nil
	}
}

let solution = Solution()

let head = List.create([1, 2, 3, 4, 5])
solution.reorderList(head)

print(head!)

print("Done!")
//: [Next](@next)
