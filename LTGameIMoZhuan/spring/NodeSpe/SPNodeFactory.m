//
//  SPNodeFactory.m
//  LTGameIMoZhuan
//
//  Created by Laketony on 2018/10/27.
//  Copyright © 2018年 Laketony. All rights reserved.
//

#import "SPNodeFactory.h"

@implementation SPNodeFactory

+(PlayerNode*)playOne:(NSString *)wuqi
                 head:(NSString *)head
                 body:(NSString *)body
{
    PlayerNode *node =  [PlayerNode node];
    
    node.wuqiStr =wuqi;
    node.headStr =head;
    node.bodyStr =body;
    
    [node updatePla];
    return node;
}



+(PlayerDZNode*)playOne:(NSString *)wuqi
                 head:(NSString *)head
                 body:(NSString *)body
                   wuqiF:(NSString *)wuqiF
{
    PlayerDZNode *node =  [PlayerDZNode node];
    
    node.wuqiStr =wuqi;
    node.headStr =head;
    node.bodyStr =body;
    node.wuqiFStr =wuqiF;
    
    [node updatePla];
    return node;
}

@end
