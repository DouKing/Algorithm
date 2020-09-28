//: [Previous](@previous)
/**
给定两个二叉树，想象当你将它们中的一个覆盖到另一个上时，两个二叉树的一些节点便会重叠。

你需要将他们合并为一个新的二叉树。合并的规则是如果两个节点重叠，那么将他们的值相加作为节点合并后的新值，否则不为 NULL 的节点将直接作为新二叉树的节点。

示例 1:

输入:
Tree 1                     Tree 2
		    1                         2
		   / \                       / \
		  3   2                     1   3
		 /                           \   \
		5                             4   7
输出:
合并后的树:
		    3
		   / \
		  4   5
		 / \   \
		5   4   7
注意: 合并必须从两个树的根节点开始。



来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/merge-two-binary-trees
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/
import Foundation

class Solution {
	func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
		guard let root1 = t1, let root2 = t2 else {
			if let t1 = t1 {
				return t1
			}
			if let t2 = t2 {
				return t2
			}
			return nil
		}

		let root = TreeNode(root1.val + root2.val)
		root.left = mergeTrees(root1.left, root2.left)
		root.right = mergeTrees(root1.right, root2.right)

		return root
	}
}

let solution = Solution()
let tree1 = Tree.createTree(values: [1,3,2,5])!
let tree2 = Tree.createTree(values: [2,1,3,nil,4,7])!

print(tree1)
print(tree2)
print(solution.mergeTrees(tree1, tree2)!)

print("Done!")
//: [Next](@next)
