//
//  GameScene.m
//  LTGameIMoZhuan
//
//  Created by Laketony on 2018/10/24.
//  Copyright © 2018年 Laketony. All rights reserved.
//

#import "GameScene.h"
#import "GameNodes.h"
#import "CtrlLine.h"
#import "LTSpriteMath.h"

@implementation GameScene
{
    SKNode *selectNode;
    CtrlLine *lineCtrl;
}

- (void)didMoveToView:(SKView *)view {
    [super didMoveToView:view];
    [self setBackgroundColor: [UIColor clearColor]];
    [self initSpring];
}
-(void)initSpring{
    SKShapeNode *box = [SKShapeNode shapeNodeWithRect:CGRectMake(-667, -350, 1334, 500)];
    [box setStrokeColor: [UIColor redColor]];
    [box setLineWidth:3];
    [self addChild:box];

    
    PlayerNode *node  = [PlayerNode node:@"g_t_weapon_hpfy" head:@"g_t_helmet_lf" body:@"g_t_back_lf"];
    [node setPosition:CGPointMake(-670, -40)];
    
    [node movetTo:CGPointMake(-440, -40)];
    
    [self addChild:node];
    
    
    PlayerNode *node1  = [PlayerNode node];
    [node1 setPosition:CGPointMake(-670, -40)];
    
    [node1 movetTo:CGPointMake(-340, -40)];
    
    [self addChild:node1];
    
    PlayerNode *nodeBoss  = [PlayerNode node:@"w_weapon_qdfz" head:@"g_t_helmet_lf" body:@"p_t_back_slz"];
    [nodeBoss setPosition:CGPointMake(700, -40)];
    [nodeBoss setScale:3];
    
    
    [nodeBoss movetTo:CGPointMake(440, -40)];
    
    [self addChild:nodeBoss];
    
    
    lineCtrl = [CtrlLine node];
    [lineCtrl lineto:CGPointZero];
    [lineCtrl setPosition:CGPointMake(0, 0)];
}
- (void)touchDownAtPoint:(CGPoint)pos {
    selectNode = [self nodeAtPoint:pos];
    if(selectNode.parent == nil){
        selectNode = nil;
        return;
    }
    selectNode = selectNode.parent;

    
    [lineCtrl setPosition:pos];
    [lineCtrl lineto:CGPointZero];
    [self addChild:lineCtrl];
}

- (void)touchMovedToPoint:(CGPoint)pos {
    CGPoint linePoint = [self convertPoint:pos toNode:lineCtrl];
    [lineCtrl lineto:linePoint];
}
- (void)touchUpAtPoint:(CGPoint)pos {
    
    if(selectNode == nil){
        return;
    }
    PlayerNode * node = selectNode;
    
    [node movetTo:pos];
    
   
    selectNode = nil;
    [lineCtrl removeFromParent];
}

-(void)update:(NSTimeInterval)currentTime{
    [super update:currentTime];
    
}

@end
