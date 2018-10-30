//
//  PlayerDZNode.m
//  LTGameIMoZhuan
//
//  Created by Laketony on 2018/10/30.
//  Copyright © 2018年 Laketony. All rights reserved.
//

#import "PlayerDZNode.h"

@implementation PlayerDZNode
{
    
}

+ (instancetype)node{
    PlayerDZNode *node =  [super node];
    node.wuqiFStr=@"g_t_weapon_jezh";
    return node;
}




-(void)initPla{
    [super initPla];
    
    if (self.wuqiFStr == nil||[@"" isEqualToString:self.wuqiFStr]) {
        self.wuqiFStr = @"g_t_weapon_jezh";
    }
    
    wuqiF = [SKSpriteNode spriteNodeWithImageNamed:self.wuqiFStr];
    [wuqiF setPosition:CGPointMake(40, -16)];
    [wuqiF setAnchorPoint:CGPointMake(0.8, 0.2)];
    [self addChild:wuqiF];
    
    //
    [body setHidden:YES];
    
}

-(void)updatePla{
    [super updatePla];
    [wuqiF setTexture:[SKTexture textureWithImageNamed:self.wuqiFStr]];
    [wuqiF setPosition:CGPointMake(40, -16)];
    [wuqiF setAnchorPoint:CGPointMake(0.8, 0.2)];
}

-(void)fmsRuning{
    [super fmsRuning];
    [wuqiF setPosition:CGPointMake(40, -16)];
    [wuqiF runAction:[SKAction repeatActionForever:[SKAction sequence:act_du]] withKey:@"fmsRuning" ];
    
}
-(void)fmsStand{
    [super fmsStand];
    
    [wuqiF removeAllActions];
    [wuqiF runAction: [SKAction moveTo:CGPointMake(40, -16) duration:0.1]];
}

@end
