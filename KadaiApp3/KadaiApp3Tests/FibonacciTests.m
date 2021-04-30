//
//  FibonacciTests.m
//  KadaiApp3Tests
//
//  Created by j-kugizaki on 2021/04/30.
//

#import <XCTest/XCTest.h>
#import "../KadaiApp3/Fibonacci.h"

@interface FibonacciTests : XCTestCase

@end

@implementation FibonacciTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testFibonacci {
    Fibonacci *f = [[Fibonacci alloc]init];
    XCTAssertEqual([f Do:0], 0);
    XCTAssertEqual([f Do:1], 1);
    XCTAssertEqual([f Do:2], 0+1);
    XCTAssertEqual([f Do:3], 1+1);
}

@end
