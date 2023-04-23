class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        } else {
        var number = x
        var sum = 0
        
        while number > 0 {
            sum = sum * 10 + number % 10
            number /= 10
        }
        
        return x == sum
        }
    }
}
