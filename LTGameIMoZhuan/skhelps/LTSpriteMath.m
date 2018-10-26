//
//  LTSpriteMath.m
//  LTGuofen
//
//  Created by Laketony on 2017/10/26.
//  Copyright © 2017年 Laketony. All rights reserved.
//


#import "LTSpriteMath.h"


CGPoint CGPointSub(CGPoint a,CGPoint b)
{
    return CGPointMake(a.x-b.x, a.y-b.y);
}

CGPoint CGPointSubNixiang(CGPoint a,CGPoint b)
{
    return CGPointMake(a.x-b.x, b.y-a.y);
}

CGPoint CGPointAdd(CGPoint a,CGPoint b)
{
    return CGPointMake(a.x+b.x, a.y+b.y);
}
CGPoint CGPointAddY(CGPoint a,CGPoint b)
{
    return CGPointMake(a.x, a.y+b.y);
}
CGPoint CGPointAddX(CGPoint a,CGPoint b)
{
    return CGPointMake(a.x + b.x, a.y);
}

CGFloat LTLineLength(CGPoint a,CGPoint b)
{
    CGFloat deltaX = b.x - a.x;
    CGFloat deltaY = b.y - a.y;
    return sqrt(deltaX*deltaX + deltaY*deltaY );
}


CGPoint CGPointMul(CGPoint a,CGFloat b){
    return CGPointMake(a.x*b, a.y*b);
}
