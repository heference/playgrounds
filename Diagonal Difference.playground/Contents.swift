/*
 Given a square matrix, calculate the absolute difference between the sums of its diagonals.
 
 For example, the square matrix  is shown below:
 
 1 2 3
 4 5 6
 9 8 9
 The left-to-right diagonal = . The right to left diagonal = . Their absolute difference is .
 
 Function description
 
 Complete the  function in the editor below. It must return an integer representing the absolute diagonal difference.
 
 diagonalDifference takes the following parameter:
 
 arr: an array of integers .
 Input Format
 
 The first line contains a single integer, , the number of rows and columns in the matrix .
 Each of the next  lines describes a row, , and consists of  space-separated integers .
 
 Constraints
 
 Output Format
 
 Print the absolute difference between the sums of the matrix's two diagonals as a single integer.
 
 Sample Input
 
 3
 11 2 4
 4 5 6
 10 8 -12
 Sample Output
 
 15
 Explanation
 
 The primary diagonal is:
 
 11
 5
 -12
 Sum across the primary diagonal: 11 + 5 - 12 = 4
 
 The secondary diagonal is:
 
 4
 5
 10
 Sum across the secondary diagonal: 4 + 5 + 10 = 19
 Difference: |4 - 19| = 15
 
 Note: |x| is the absolute value of x
*/

import Foundation

func diagonalDifference(arr: [[Int]]) -> Int {
    // Write your code here
//    let lines = arr.first?.first ?? 0
//    let array = arr.filter({ $0.count > 1 })
//    var leftToRightSum = 0
//    var rightToLeftSum = 0
//
//    for index in 0...lines-1 {
//        leftToRightSum += array[index][index]
//        rightToLeftSum += array[index][lines-1-index]
//    }
//
//    return abs(abs(leftToRightSum) - abs(rightToLeftSum))
//    let array = arr.filter({ $0.count > 1 })
    
    
    // Solution
    // get primary diagonal
    var primaryDiagonalSum: Int {
        var pos = 0
        var sum = 0
        // traverse array, add int at index
        for line in arr {
            sum += (line[pos])
            pos += 1
        }
        return sum
    }
    
    // get secondary diagonal
    var secondaryDiagonalSum: Int {
        var pos = 0
        var sum = 0
        // traverse array backwards, add int at index
        for line in (0...arr.count - 1).reversed() {
            sum += (arr[line])[pos]
            pos += 1
        }
        return sum
    }
    
    return abs(primaryDiagonalSum - secondaryDiagonalSum)
}


let sample: [[Int]] = [
    [6, 6, 7, -10, 9, -3, 8, 9, -1],
    [9, 7, -10, 6, 4, 1, 6, 1, 1],
    [-1, -2, 4, -6, 1, -4, -6, 3, 9],
    [-8, 7, 6, -1, -6, -6, 6, -7, 2],
    [-10, -4, 9, 1, -7, 8, -5, 3, -5],
    [-8, -3, -4, 2, -3, 7, -5, 1, -5],
    [-2, -7, -4, 8, 3, -1, 8, 2, 3],
    [-3, 4, 6, -7, -7, -8, -3, 9, -6],
    [-2, 0, 5, 4, 4, 4, -3, 3, 0]
]

diagonalDifference(arr: sample)


