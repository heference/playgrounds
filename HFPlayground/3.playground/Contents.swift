import Foundation

//[1, 1, 9, 3, 7, 6, 5, 10]    4    28
//[1, 1, 5, 1, 1]    1    5

func solution(_ estimates:[Int], _ k:Int) -> Int {

    var sumArray:[Int] = []
    for index in 0...estimates.count-k {
        let array = estimates[index...index+k-1]
        sumArray.append(array.reduce(0, +))
    }

    return sumArray.max() ?? 0
}

let a = [1, 1, 9, 3, 7, 6, 5, 10]
let b = [1, 1, 5, 1, 1]

solution(a, 4)
solution(b, 1)
