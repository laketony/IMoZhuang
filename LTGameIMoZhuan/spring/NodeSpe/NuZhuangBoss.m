//
//  NuZhuangBoss.m
//  LTGameIMoZhuan
//
//  Created by Laketony on 2018/10/29.
//  Copyright © 2018年 Laketony. All rights reserved.
//

#import "NuZhuangBoss.h"

@implementation NuZhuangBoss
{
    SKSpriteNode * body;
}

//

+ (instancetype)node{
    NuZhuangBoss *node =  [super node]; 
    
    [node initPla];
    return node;
}

-(void)initPla{
    body = [SKSpriteNode spriteNodeWithImageNamed:@"courage_open"];
    [body setScale:3];
    [body setAnchorPoint:CGPointMake(0.5, 0)];
    
    [self addChild:body];
}

@end
