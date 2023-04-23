class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.isEmpty { return 0 }
        
        var pointerIndex: Int = 1
        
        for index in 0..<nums.count - 1 {
            if nums[index] == nums[index + 1] {
                continue
            } else {
                nums[pointerIndex] = nums[index + 1]
                pointerIndex += 1
            }
        }
        return pointerIndex
    }
}
