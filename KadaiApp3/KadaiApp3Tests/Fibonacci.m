//
//  Fibonacci.m
//  KadaiApp3
//
//  Created by j-kugizaki on 2021/04/30.
//

#import "Fibonacci.h"

@interface Fibonacci ()

@end

@implementation Fibonacci

- (NSInteger)Do:(NSInteger)n {
    int a = 0;
    int b = 1;
    int c = 0;
    for(int i = 0; i < n; i++) {
        if (i <= 1) {
            c = i;
        } else {
            c = a + b;
            a = b;
            b = c;
        }
    }
    return c;
}

@end
