class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var hashTable = Dictionary<Int, Int>()
        
        for (index, nums) in nums.enumerated() {
            if let value = hashTable[target - nums] { return [value, index] }
            hashTable[nums] = index
        }
        return []
    }
}
