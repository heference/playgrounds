import Foundation

func solution(_ movie:[String]) -> [String] {
    let movieSet = Set(movie)
    var sortedArray: [(name: String, count: Int)] = []
    for (_, mov) in movieSet.enumerated() {
        let count = movie.filter { $0 == mov }.count
        sortedArray.append((mov, count))
    }

    let rankedArray = sortedArray.sorted { m1, m2 in
        if m1.count > m2.count { return true }
        if m1.count == m2.count { return m1.name.lowercased() < m2.name.lowercased() }
        return false
    }
    return rankedArray.map { $0.name }
}


let movie = ["spy", "ray", "spy", "room", "once", "ray", "spy", "once"]

solution(movie)

//movie    result
//[spy,ray,spy,room,once,ray,spy,once]    [spy,once,ray,room]
