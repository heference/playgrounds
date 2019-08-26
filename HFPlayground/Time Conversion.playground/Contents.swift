import Foundation

func timeConversion(s: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "hh:mm:ssa"
    formatter.amSymbol = "AM"
    formatter.pmSymbol = "PM"
    
    var conversedDateString = ""
    if let date = formatter.date(from: s) {
        formatter.dateFormat = "HH:mm:ss"
        conversedDateString = formatter.string(from: date)
    }
    
    return conversedDateString
}

let sample = "07:05:45AM"
timeConversion(s: sample)
