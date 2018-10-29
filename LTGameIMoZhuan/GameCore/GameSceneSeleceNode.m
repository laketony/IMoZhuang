//
//  GameSceneSeleceNode.m
//  LTGameIMoZhuan
//
//  Created by Laketony on 2018/10/26.
//  Copyright © 2018年 Laketony. All rights reserved.
//

#import "GameSceneSeleceNode.h"

@implementation GameSceneSeleceNode



- (void)didMoveToView:(SKView *)view {
    [super didMoveToView:view];
    gNode = [NSMutableArray array];
    bNode = [NSMutableArray array];
}

-(SKNode*)nodeInGoodTeamAtPoint:(CGPoint)p{
    NSArray * nodes = [self nodesAtPoint:p];
    
    for (SKNode * node in nodes) {
        if([gNode containsObject:node]){
            NSLog(@"可控制");
            return node;
        }else{
            NSLog(@"不可控制");
        }
    }
    return nil;
}

@end
