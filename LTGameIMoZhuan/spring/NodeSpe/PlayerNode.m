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
    SKSpriteNode* footL;
    SKSpriteNode* footR ;
    SKSpriteNode* lefthand ;

}



+ (instancetype)node{
   PlayerNode *node =  [super node];
    node.wuqiStr =@"b_s_weapon_dczj";
    node.headStr =@"b_s_helmet_wjnq";
    node.bodyStr =@"b_s_coat_mjxj";
    [node initNodesData];
    [node initPla];
    return node;
}

-(void)initNodesData{
    [super initNodesData];
    tagers = [NSMutableArray array];
}

-(void)addAttackTager:(BaseNode*)tager{
    [tagers addObject:tager];
}


-(SKAction *)divhp{
    NSLog(@"divhp :\n");
    //[self setScale:10];
    [self runAction: [SKAction sequence:@[
                                          [SKAction fadeAlphaTo:0.2 duration:0.03],
                                          [SKAction fadeAlphaTo:1 duration:0.03],
                                          [SKAction fadeAlphaTo:0.2 duration:0.03],
                                          [SKAction fadeAlphaTo:1 duration:0.03]
                                          ]]];

    
    return [SKAction scaleBy:0.4 duration:0.3];
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
    
    
    footL = [SKSpriteNode spriteNodeWithImageNamed:@"foot"];
    [footL setPosition:CGPointMake(-16, -67)];
    [self addChild:footL];
    
    footR = [SKSpriteNode spriteNodeWithImageNamed:@"foot"];
    [footR setPosition:CGPointMake(16, -67)];
    [self addChild:footR];
    
    
    lefthand = [SKSpriteNode spriteNodeWithImageNamed:@"lefthand"];
    [lefthand setPosition:CGPointMake(34, -16)];
    [self addChild:lefthand];

    
}

-(void)updatePla{
    [wuqi setTexture:[SKTexture textureWithImageNamed:self.wuqiStr]];
    [wuqi setPosition:CGPointMake(-40, -16)];
    [wuqi setAnchorPoint:CGPointMake(0.8, 0.2)];

    
    [body setTexture:[SKTexture textureWithImageNamed:self.bodyStr]];

    
    [head setTexture:[SKTexture textureWithImageNamed:self.headStr]];
    [head setPosition:CGPointMake(0, 60)];

}


-(void)attack{
    [self.gcDelegte attackFrom:self tagers:tagers];
}



-(void)movetTo:(CGPoint)point{
    
   
    
    CGFloat moveSep = 140;
    NSTimeInterval time = LTLineLength(point,self.position)/moveSep;
    
    [self removeActionForKey:@"move"];
    
    CGFloat moveX = self.position.x - point.x;
    CGFloat absf = fabs(self.xScale);
    if(moveX>0){
        [self runAction: [SKAction scaleXTo:absf duration:0.1]];
    }else if(moveX<0){
        [self runAction: [SKAction scaleXTo:absf*-1 duration:0.1]];
    }
    
    [self runAction: [SKAction sequence:@[
                                          [SKAction moveTo:point duration:time],
                                          [SKAction performSelector:@selector(fmsStand) onTarget:self]
                                          ]] withKey:@"move"];
    [self fmsRuning];
}

-(void)fmsStand{
    [head removeAllActions];
    [body removeAllActions];
    [wuqi removeAllActions];
    [wuqi runAction: [SKAction moveTo:CGPointMake(-40, -16) duration:0.1]];
    
    
    [footL removeAllActions];
    [footL setPosition:CGPointMake(-16, -50)];
    [footR removeAllActions];
    [footR setPosition:CGPointMake(16, -50)];
    
    [lefthand removeAllActions];
    [lefthand setPosition:CGPointMake(34, -16)];
}



-(void)fmsRuning{
    
    
    NSArray *ud = @[
                    [SKAction moveByX:-4 y:10 duration:0.2],
                    [SKAction moveByX:4 y:-10 duration:0.2]
                    ];
    
    NSArray *du = @[
                    [SKAction moveByX:4 y:-10 duration:0.2],
                    [SKAction moveByX:-4 y:10 duration:0.2]
                    ];
    
    NSArray *dul = @[
                    [SKAction moveByX:2 y:-4 duration:0.2],
                    [SKAction moveByX:-2 y:4 duration:0.2]
                    ];
    
    [wuqi setPosition:CGPointMake(-40, -16)];
    
    [wuqi runAction:[SKAction repeatActionForever:[SKAction sequence:du]] withKey:@"fmsRuning" ];
    
    
    
    [head setPosition:CGPointMake(0, 60)];

    [head runAction:[SKAction repeatActionForever:[SKAction sequence:dul]] withKey:@"fmsRuning" ];
    

    [footL setPosition:CGPointMake(-16, -50)];
    [footL runAction:[SKAction repeatActionForever:[SKAction sequence:ud]] withKey:@"fmsRuning" ];
    
    
    [footR setPosition:CGPointMake(16, -50)];
    [footR runAction:[SKAction repeatActionForever:[SKAction sequence:du]] withKey:@"fmsRuning" ];
    
    [lefthand setPosition:CGPointMake(34, -16)];
    [lefthand runAction:[SKAction repeatActionForever:[SKAction sequence:ud]] withKey:@"fmsRuning" ];
    
    
}

@end
