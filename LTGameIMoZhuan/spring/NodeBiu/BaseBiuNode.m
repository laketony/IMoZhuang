//
//  BaseBiuNode.m
//  LTGameIMoZhuan
//
//  Created by Laketony on 2018/10/27.
//  Copyright © 2018年 Laketony. All rights reserved.
//

#import "BaseBiuNode.h"

@implementation BaseBiuNode



//b_xljx_attack_atlas
+ (instancetype)node{
    BaseBiuNode *node = [super node];
    SKTexture *tx = [SKTexture textureWithImageNamed:@"b_xljx_attack_atlas"];
    SKSpriteNode *txNode = [SKSpriteNode spriteNodeWithTexture:tx];
    [txNode setAnchorPoint:CGPointMake(1, 0.5)];
    [node addChild:txNode];
    return node;
}
@end
