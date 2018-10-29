//
//  PlayerNode.h
//  LTGameIMoZhuan
//
//  Created by Laketony on 2018/10/26.
//  Copyright © 2018年 Laketony. All rights reserved.
//

#import "BaseNode.h"

#import "GameGc.h"

NS_ASSUME_NONNULL_BEGIN



@interface PlayerNode : BaseNode
{
    NSMutableArray*tagers;
}

@property(nonatomic,strong) NSString *wuqiStr;
@property(nonatomic,strong) NSString *headStr;
@property(nonatomic,strong) NSString *bodyStr;


@property(nonatomic,weak) id<GameGC> gcDelegte;

-(void)updatePla;

-(void)movetTo:(CGPoint)point;

-(void)attack;
-(void)addAttackTager:(BaseNode*)tager;

@end

NS_ASSUME_NONNULL_END
