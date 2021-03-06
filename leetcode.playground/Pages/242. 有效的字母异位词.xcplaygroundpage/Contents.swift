//: [Previous](@previous)
/**
给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。

示例 1:

输入: s = "anagram", t = "nagaram"
输出: true
示例 2:

输入: s = "rat", t = "car"
输出: false
说明:
你可以假设字符串只包含小写字母。

进阶:
如果输入字符串包含 unicode 字符怎么办？你能否调整你的解法来应对这种情况？

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/valid-anagram
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/
import Foundation

class Solution {
	func isAnagram(_ s: String, _ t: String) -> Bool {
		let length = s.count
		guard t.count == length else {
			return false
		}

		let str1: [Character] = s.suffix(length)
		let str2: [Character] = t.suffix(length)
		var map = [Character: Int]()

		for i in 0 ..< length {
			let char1 = str1[i]
			let char2 = str2[i]
			map[char1] = (map[char1] ?? 0) + 1
			map[char2] = (map[char2] ?? 0) - 1
		}

		for num in map.values {
			if num != 0 {
				return false
			}
		}

		return true
	}
}

let solution = Solution()

assert(solution.isAnagram("anagram", "nagaram"))
assert(!solution.isAnagram("rat", "car"))

print("Done!")
//: [Next](@next)
