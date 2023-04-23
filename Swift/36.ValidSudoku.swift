class Solution {
    
    func convertArray(_ input: [Character]) -> [Int]{
        let input = input.filter { $0 != "." }.map { Int(String($0))! }
        return input
    }
    
    func validateSegment(_ input: [Int]) -> Bool {
        return input.count == Set(input).count
    }
    
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        
        var isValid = true
        var indexRow = 0
        let segmentBorders = [0, 3, 6]
        
        while indexRow < 9 {
            var indexCol = 0
            let rowArray = convertArray(board[indexRow])
            var tempCol = [Character]()
            while indexCol < 9 {
                tempCol.append(board[indexCol][indexRow])
                indexCol += 1
            }
            
            let colArray = convertArray(tempCol)
            
            isValid = isValid && validateSegment(rowArray) && validateSegment(colArray)
            
            if !isValid { return false  }
            indexRow += 1
        }
        
        var segment = [[Int]: [Int]]()
        
        for rowSegment in segmentBorders {
            for row in 0...2 {
                for colSegment in segmentBorders {
                    var tempSegment = [Character]()
                    for col in 0...2 {
                        tempSegment.append(board[row + rowSegment][col + colSegment])
                    }
                    segment[[rowSegment, colSegment], default: []] += convertArray(tempSegment)
                }
            }
        }
        
        for values in segment.values {
            isValid = isValid && validateSegment(values)
        }
        
        return isValid
    }
}
