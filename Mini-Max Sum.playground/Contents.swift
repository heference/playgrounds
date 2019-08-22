import Foundation


func miniMaxSum(arr: [Int]) -> Void {
    guard let min = arr.min() else { return }
    guard let max = arr.max() else { return }
    
    let minArray = arr.filter { $0 != max }
    let maxArray = arr.filter { $0 != min }
    
    var minSum = 0
    var maxSum = 0
    
    if minArray.count > 0 && maxArray.count > 0 {
        minSum = minArray.reduce(0) { $0 + $1 }
        maxSum = maxArray.reduce(0) { $0 + $1 }
    } else {
        minSum = min * 4
        maxSum = max * 4
    }

    print(minSum, maxSum)
}


let sample1 = [1, 2, 3, 4, 5]
let sample2 = [5, 5, 5, 5, 5]
miniMaxSum(arr: sample1)
miniMaxSum(arr: sample2)
