//
//  MyProxy.h
//  HoodMothed
//
//  Created by dengbin on 2017/9/12.
//  Copyright © 2017年 dengbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyProxy : NSProxy
{

}

@property (nonatomic, strong) id consignor;

+ (instancetype)proxyWithConsignor: (id)consignor;
///** */
//@property(nonatomic,strong)id object;
//
//- (id)proxyForObject:(id)obj;

@end
