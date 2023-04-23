class Solution {
    func romanToInt(_ string: String) -> Int {
        let accordanceDictionary: [Character:Int] = ["I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000]
        
        var answer = 0, previous = 0
        
        for i in string {
            let value = accordanceDictionary[i] ?? 0
            answer += value <= previous ? previous : -previous
            previous = value
        }
        
        answer += previous
        
        return answer
    }
}
