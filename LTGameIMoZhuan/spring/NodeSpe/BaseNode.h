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

-(void)movetTo:(CGPoint)point;
-(SKAction *)divhp;
-(void)initNodesData;
@end

NS_ASSUME_NONNULL_END
