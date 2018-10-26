//
//  PlayerNode.m
//  LTGameIMoZhuan
//
//  Created by Laketony on 2018/10/26.
//  Copyright © 2018年 Laketony. All rights reserved.
//

#import "PlayerNode.h"

@implementation PlayerNode
{

    SKSpriteNode *head;
    SKSpriteNode *body;
    SKSpriteNode *wuqi;
}

+ (instancetype)node{
   PlayerNode *node =  [super node];
    node.wuqiStr =@"b_s_weapon_dczj";
    node.headStr =@"b_s_helmet_wjnq";
    node.bodyStr =@"b_s_coat_mjxj";
    
    [node initPla];
    return node;
}

+ (instancetype)node:(NSString *)wuqi
                head:(NSString *)head
                body:(NSString *)body {
    PlayerNode *node =  [super node];
    
    node.wuqiStr =wuqi;
    node.headStr =head;
    node.bodyStr =body;
    
    [node initPla];
    return node;
}

-(void)initPla{
    wuqi = [SKSpriteNode spriteNodeWithImageNamed:self.wuqiStr];
    [wuqi setPosition:CGPointMake(-40, -16)];
    [wuqi setAnchorPoint:CGPointMake(0.8, 0.2)];
    [self addChild:wuqi];
    
    body = [SKSpriteNode spriteNodeWithImageNamed:self.bodyStr];
    [self addChild:body];
    
    head = [SKSpriteNode spriteNodeWithImageNamed:self.headStr];
    [head setPosition:CGPointMake(0, 60)];
    [self addChild:head];
}
-(void)movetTo:(CGPoint)point{
    
   
    
    CGFloat moveSep = 140;
    NSTimeInterval time = LTLineLength(point,self.position)/moveSep;
    
    [self removeAllActions];
    
    CGFloat moveX = self.position.x - point.x;
    CGFloat absf = fabs(self.xScale);
    if(moveX>=0){
        [self runAction: [SKAction scaleXTo:absf duration:0.1]];
    }else{
        [self runAction: [SKAction scaleXTo:absf*-1 duration:0.1]];
    }
    
    [self runAction: [SKAction sequence:@[
                                                [SKAction moveTo:point duration:time],
                                                [SKAction performSelector:@selector(fmsStand) onTarget:self]
                                                ]]];
    [self fmsRuning];
}

-(void)fmsStand{
    [head removeAllActions];
    [body removeAllActions];
    [wuqi removeAllActions];
    [wuqi runAction: [SKAction moveTo:CGPointMake(-40, -16) duration:0.1]];
}



-(void)fmsRuning{
    
    [wuqi setPosition:CGPointMake(-40, -16)];
    NSArray *ud = @[
                    [SKAction moveByX:0 y:10 duration:0.2],
                    [SKAction moveByX:0 y:-10 duration:0.2]
                    ];
    [wuqi runAction:[SKAction repeatActionForever:[SKAction sequence:ud]] withKey:@"fmsRuning" ];
    
    
    
    [head setPosition:CGPointMake(0, 60)];
    NSArray *du = @[
                    [SKAction moveByX:2 y:-4 duration:0.2],
                    [SKAction moveByX:-2 y:4 duration:0.2]
                    ];
    [head runAction:[SKAction repeatActionForever:[SKAction sequence:du]] withKey:@"fmsRuning" ];
    

    
}

@end
