import Foundation

func howManyGames(p: Int, d: Int, m: Int, s: Int) -> Int {
    if s >= m {
        var costByTicketArray: [Int] = []
        
        for index in 0...s/m-1 {
            costByTicketArray.append(p - d * index)
        }
        
        costByTicketArray = costByTicketArray.map { (value: Int) -> Int in
            if value < m {
                return m
            } else if value - d < m {
                return m
            } else {
                return value - d
            }
        }
        
        costByTicketArray.insert(p, at: 0)
        
        var gameCount = 0
        var costSum = 0
        
        for cost in costByTicketArray {
            if s >= costSum {
                gameCount += 1
                costSum += cost
            }
        }
        
        return gameCount - 1
        
    } else {
        return 0
    }
}

//let p = 20
//let d = 3
//let m = 6
//let s = 85

//let p = 16
//let d = 2
//let m = 1
//let s = 9981

let p = 100
let d = 11
let m = 10
let s = 1

print(howManyGames(p: p, d: d, m: m, s: s))
