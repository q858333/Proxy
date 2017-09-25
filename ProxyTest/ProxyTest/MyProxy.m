//
//  MyProxy.m
//  HoodMothed
//
//  Created by dengbin on 2017/9/12.
//  Copyright © 2017年 dengbin. All rights reserved.
//

#import "MyProxy.h"
@implementation MyProxy

+ (instancetype)proxyWithConsignor: (id)consignor {
    return [[self alloc] initWithConsignor: consignor];
}

- (instancetype)initWithConsignor:(id)consignor {
        self.consignor = consignor;
    

    return self;
}

- (void)forwardInvocation:(NSInvocation *)invocation{
    if (self.consignor != nil) {




        if ([self isEqualToSEL:invocation.selector])
        {
            [invocation setTarget:self];
            [invocation invoke];

        }else
        {
            [invocation setTarget:self.consignor];

            [invocation invoke];
        }

    }
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    NSMethodSignature *result;
    if (self.consignor != nil) {
        result = [self.consignor methodSignatureForSelector:sel];
    } else {
        // Will throw an exception as default implementation
        result = [super methodSignatureForSelector:sel];
    }
    return result;
}


- (BOOL )isEqualToSEL:(SEL)sel{
    NSArray  *methods = @[NSStringFromSelector(@selector(connectionDidFinishLoading:)),




                          ];


    NSString *method = NSStringFromSelector(sel);

    if ([methods containsObject:method])
    {
        return YES;
    }

    return NO;



}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"my------connectionDidFinishLoading");

    if ([self.consignor respondsToSelector:@selector(connectionDidFinishLoading:)])
    {
        [self.consignor connectionDidFinishLoading:connection];
    }

}

@end
