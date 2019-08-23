import Foundation

func birthdayCakeCandles(ar: [Int]) -> Int {
    guard let max = ar.max() else { return 0 }
    let maxArray = ar.filter { $0 == max }
    return maxArray.count
}


let sample = [3, 2, 1, 3]
birthdayCakeCandles(ar: sample)

