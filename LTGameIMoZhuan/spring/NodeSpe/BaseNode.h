//
//  BaseNode.h
//  LTGameIMoZhuan
//
//  Created by Laketony on 2018/10/24.
//  Copyright © 2018年 Laketony. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "LTSpriteMath.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseNode : SKNode

-(SKAction *)divhp;
-(void)initNodesData;


-(void)movetTo:(CGPoint)point;
-(void)fmsStand;
-(void)fmsRuning;

@end

NS_ASSUME_NONNULL_END
