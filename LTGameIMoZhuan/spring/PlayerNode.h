//
//  PlayerNode.h
//  LTGameIMoZhuan
//
//  Created by Laketony on 2018/10/26.
//  Copyright © 2018年 Laketony. All rights reserved.
//

#import "BaseNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlayerNode : BaseNode

@property(nonatomic,strong) NSString *wuqiStr;
@property(nonatomic,strong) NSString *headStr;
@property(nonatomic,strong) NSString *bodyStr;

+ (instancetype)node:(NSString *)wuqi
                head:(NSString *)head
                body:(NSString *)body;

-(void)movetTo:(CGPoint)point;

@end

NS_ASSUME_NONNULL_END
