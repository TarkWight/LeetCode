class Solution {
    func longestCommonPrefix(_ string: [String]) -> String {
        if string.isEmpty { return "" }
        if string.count == 1 { return string[0] }
        
        let string = string.sorted()
        var answer: String = ""
        
        for (charFirst, charSecond) in zip(string.first!, string.last!) {
            if charFirst == charSecond {
                answer += String(charFirst)
            } else { break }
        }
        
        return answer
    }
}
