//
//  BaseNode.m
//  LTGameIMoZhuan
//
//  Created by Laketony on 2018/10/24.
//  Copyright © 2018年 Laketony. All rights reserved.
//

#import "BaseNode.h"

@implementation BaseNode


-(void)movetTo:(CGPoint)point{
    
    
    
    CGFloat moveSep = 140;
    NSTimeInterval time = LTLineLength(point,self.position)/moveSep;
    
    [self removeAllActions];
    
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
                                          ]]];
    [self fmsRuning];
}

-(void)fmsStand{
    
}

-(void)fmsRuning{

}


-(SKAction *)divhp{
    return nil;
}

-(void)initNodesData{
   
}

@end
