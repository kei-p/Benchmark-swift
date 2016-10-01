//
//  Benchmark.swift
//  Benchmark
//
//  Copyright © 2016年 kei-p. All rights reserved.


import Foundation
import Swift

public extension Benchmark {
    class func start(key: String) -> Benchmark {
        return Benchmark(key: key).start()
    }
    
    class func measure(key: String, block: () -> ()) -> Benchmark {
        let benchmark = Benchmark(key: key).start()
        block()
        return benchmark.end()
    }
    
    func start() -> Benchmark {
        laps.append(Lap(key: "start", date: NSDate()))
        return self
    }
    
    func lap(lapKey: String) {
        laps.append(Lap(key: lapKey, date: NSDate()))
    }
    
    func end() -> Benchmark {
        laps.append(Lap(key: "end", date: NSDate()))
        return self
    }
    
    var description : String {
        let title = "Benchmark \(self.key) {\n"
        
        guard let startedAt = self.startedAt else {
            return "\(title) : Invalid }"
        }
        let text = laps.map { (lap) -> String in
            String(format: " %@ \t%.3f sec - %@\n", lap.key, lap.timeInterval(startedAt), lap.date)
            }.reduce("", combine: +)
        return "\(title)\(text)}"
    }
}

public class Benchmark : CustomStringConvertible {
    struct Lap {
        let key  : String
        let date : NSDate
        
        func timeInterval(startedAt: NSDate) -> NSTimeInterval {
            return date.timeIntervalSinceDate(startedAt)
        }
    }
    
    var laps      : [Lap] = []
    let key : String
    
    
    init(key: String) {
        self.key = key
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