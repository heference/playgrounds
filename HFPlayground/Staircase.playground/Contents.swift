import Foundation

func staircase(n: Int) -> Void {
    var stair = ""
    
    for step in 1...n {
        stair += String(repeating: " ", count: n-step) + String(repeating: "#", count: step) + "\n"
    }
    print(stair)
}

let n = 6
staircase(n: n)
