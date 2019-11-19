import Foundation

func solution(_ n:Int) -> Int {

    let number = String(n)
    let decendingDigit = number.compactMap{ $0.wholeNumberValue }.sorted { $0 > $1 }
    let ascendingDigit = number.compactMap{ $0.wholeNumberValue }.sorted { $0 < $1 }

    var decendingString = ""
    var ascendingString = ""

    for number in decendingDigit {
        decendingString.append(String(number))
    }

    for number in ascendingDigit {
        ascendingString.append(String(number))
    }

    let max = Int(decendingString) ?? 0
    let min = Int(ascendingString) ?? 0

    return max + min
}


var a = 2613
//2613    7557


var b = 33285
//33285    108690


solution(a)
solution(b)





