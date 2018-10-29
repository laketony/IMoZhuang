//
//  GameScene.m
//  LTGameIMoZhuan
//
//  Created by Laketony on 2018/10/24.
//  Copyright © 2018年 Laketony. All rights reserved.
//

#import "GameScene.h"

#import "SPNodeFactory.h"
#import "BaseBiuNode.h"

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

    //由于 大秘境 和 小秘境 不准备更换舞台 scene 所以区分了 初始化友军 和初始化敌军
    [self initGoodTeam];
    [self initBadTeam];
    
    lineCtrl = [CtrlLine node];
    [lineCtrl lineto:CGPointZero];
    [lineCtrl setPosition:CGPointMake(0, 0)];
}

//初始化友军单位
-(void)initGoodTeam{
    PlayerNode *node = [SPNodeFactory playOne:@"g_t_weapon_hpfy" head:@"g_t_helmet_lf" body:@"g_t_back_lf"];
    [node setPosition:CGPointMake(-770, -40)];
    
    [node movetTo:CGPointMake(-440, -40)];
    
    [node setGcDelegte:self];
    [self addChild:node];
    
    [gNode addObject:node];
    
    
    NSArray *attackActionArray = @[
                                   [SKAction waitForDuration:0.01],
                                   [SKAction  performSelector:@selector(attack) onTarget:node],
                                   [SKAction waitForDuration:2],
                                   ];
    [node runAction: [SKAction repeatActionForever:[SKAction sequence:attackActionArray]]];
    
    
    
    PlayerNode *nodeLR = [SPNodeFactory playOne:@"w_weapon_jf" head:@"p_t_helmet_trsf" body:@"p_t_coat_trsf"];
    [nodeLR setPosition:CGPointMake(-770, -140)];
    
    [nodeLR movetTo:CGPointMake(-440, -140)];
    [nodeLR setGcDelegte:self];
    [nodeLR addAttackTager:node];
    
    [self addChild:nodeLR];
    [gNode addObject:nodeLR];
    
    NSArray *attackActionArrayLR = @[
                                   [SKAction waitForDuration:0.01],
                                   [SKAction  performSelector:@selector(attack) onTarget:nodeLR],
                                   [SKAction waitForDuration:2],
                                   ];
    [nodeLR runAction: [SKAction repeatActionForever:[SKAction sequence:attackActionArrayLR]]];
    
    
    
    PlayerNode *node1  = [PlayerNode node];
    [node1 setPosition:CGPointMake(-670, -40)];
    
    [node1 movetTo:CGPointMake(-300, -40)];
    
    [self addChild:node1];
    
    [gNode addObject:node1];
 
    
}

//初始化敌军单位
-(void)initBadTeam{
    
    //木桩boss
    NuZhuangBoss *nodeBoss  = [NuZhuangBoss node];
    [nodeBoss setPosition:CGPointMake(700, -40)];
    
    
    [nodeBoss movetTo:CGPointMake(440, -40)];
    
    [self addChild:nodeBoss];
    [bNode addObject:nodeBoss];
    
}

-(void)attackFrom:(SKNode*)attacker_node tagers:(NSArray *)tagers_node
{
    NSLog(@"attacker_node:%@ ",attacker_node);
    for(SKNode* tager_node in tagers_node){
        BaseBiuNode *biu = [BaseBiuNode node];
        CGPoint spoint = [attacker_node convertPoint:CGPointMake(-10*attacker_node.xScale, 2*attacker_node.yScale)
                                              toNode:self];
        [biu setPosition:spoint];
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, nil, spoint.x, spoint.y);
        CGPathAddLineToPoint(path, nil, tager_node.position.x, tager_node.position.y);
        
        SKAction *biuMove = [SKAction followPath:path asOffset:NO orientToPath:YES duration:0.25];
        
        
        SKAction *niu = [SKAction sequence:@[
                                             biuMove,
                                             [SKAction performSelector:@selector(divhp) onTarget:tager_node],
                                             [SKAction waitForDuration:0.3],
                                             [SKAction removeFromParent]
                                             ]];
        [biu runAction:niu];
        
        [self addChild:biu];
    }
}


- (void)touchDownAtPoint:(CGPoint)pos {
    selectNode = [self nodeInGoodTeamAtPoint:pos];
    if(selectNode == nil){
        return;
    }

    
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
