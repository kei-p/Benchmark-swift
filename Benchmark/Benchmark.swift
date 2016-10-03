//
//  Benchmark.swift
//  Benchmark
//
//  Copyright © 2016年 kei-p. All rights reserved.


import Foundation
import Swift

public extension Benchmark {
    static var logger : (String) -> () = { text in print(text) }
    
    func measure(block: (Benchmark) -> ()) -> Benchmark {
        start()
        block(self)
        return end()
    }
    
    func start() -> Benchmark {
        _lap("start")
        return self
    }
    
    func lap(lapKey: String) {
        _lap(lapKey)
    }
    
    func end() -> Benchmark {
        _lap("end")
        return self
    }
    
    var description : String {
        let title = "Benchmark \(self.key)"
        
        guard (self.startedAt != nil) else {
            return "\(title) : Invalid"
        }
        
        let text = laps.map { (lap) -> String in
            lap.resultLog(self) + "\n"
        }.reduce("", combine: +)
        return "\(title){\n\(text)}"
    }
}

public class Benchmark : CustomStringConvertible {
    struct Lap {
        let key  : String
        let date : NSDate
        
        func timeInterval(startedAt: NSDate) -> NSTimeInterval {
            return date.timeIntervalSinceDate(startedAt)
        }
        
        func lapLog(benchmark: Benchmark) -> String {
            return String(format: "%@.%@ \t%.3f sec", benchmark.key, self.key, self.timeInterval(benchmark.startedAt!), self.date)
        }
        
        func resultLog(benchmark: Benchmark) -> String {
            return String(format: " %@ \t%.3f sec", self.key, self.timeInterval(benchmark.startedAt!), self.date)
        }
    }
    
    var laps : [Lap] = []
    let key : String
    var autoLog : Bool = true
    
    init(_ key: String, autoLog: Bool = true) {
        self.key = key
        self.autoLog = autoLog
    }
    
    private func _lap(lapKey: String) {
        let lap = Lap(key: lapKey, date: NSDate())
        laps.append(lap)
        if(self.autoLog) { Benchmark.logger(lap.lapLog(self)) }
    }
    
    var startedAt : NSDate? {
        let lap = laps.filter { $0.key == "start" }.first
        return lap?.date
    }
    
    var totalElapsedTime : NSTimeInterval {
        guard let startedAt = self.startedAt, last = laps.last else {
            return 0
        }
        return last.timeInterval(startedAt)
    }
}