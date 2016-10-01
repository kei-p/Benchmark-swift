//
//  BenchmarkTests.swift
//  BenchmarkTests
//
//  Created by Keisuke on 2016/10/01.
//  Copyright © 2016年 kei-p. All rights reserved.
//

import XCTest
@testable import Benchmark

class BenchmarkTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMeasure() {
        let b = Benchmark.measure("test") {
            sleep(1)
        }
        print(b)
    }
    
    func testLap() {
        let b = Benchmark.start("test")
        sleep(1)
        b.lap("1")
        sleep(1)
        b.lap("2")
        sleep(1)
        b.end()
        print(b)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
