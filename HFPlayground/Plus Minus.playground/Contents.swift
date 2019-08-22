import Foundation

func plusMinus(arr: [Int]) -> Void {
    var plusCount: Double = 0
    var zeroCount: Double = 0
    var minusCount: Double = 0
    let count = Double(arr.count)
    
    for number in arr {
        if number > 0 {
            plusCount += 1
        } else if number == 0 {
            zeroCount += 1
        } else if number < 0 {
            minusCount += 1
        }
    }
    
    print(String(format: "%.7f", plusCount/count))
    print(String(format: "%.7f", minusCount/count))
    print(String(format: "%.7f", zeroCount/count))
}

let sample = [-4, 3, -9, 0, 4, 1]
plusMinus(arr: sample)
