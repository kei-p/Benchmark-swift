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
        Benchmark("test").measure { _ in
            sleep(1)
        }
    }
    
    func testMeasureWithLap() {
        Benchmark("test").measure { b in
            sleep(1)
            b.lap("1")
            sleep(1)
            b.lap("2")
            sleep(1)
        }
    }
    
    func testLap() {
        let b = Benchmark("test").start()
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
