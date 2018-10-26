//
//  CtrlLine.m
//  LTGameIMoZhuan
//
//  Created by Laketony on 2018/10/25.
//  Copyright © 2018年 Laketony. All rights reserved.
//

#import "CtrlLine.h"

@implementation CtrlLine

-(void)lineto:(CGPoint)pos{
    
    [[self childNodeWithName:@"cyt"] removeFromParent];
    SKShapeNode * cyt =[SKShapeNode shapeNodeWithEllipseOfSize:CGSizeMake(120, 40)];
    [cyt setLineWidth:5];
    [cyt setStrokeColor: [UIColor greenColor]];
    [cyt setName:@"cyt"];
    [self addChild:cyt];
    
    
    [[self childNodeWithName:@"cytcen"] removeFromParent];
    SKShapeNode * cytcen =[SKShapeNode shapeNodeWithCircleOfRadius:5];
    [cytcen setLineWidth:1];
    [cytcen setFillColor: [UIColor greenColor]];
    [cytcen setStrokeColor: [UIColor greenColor]];
    [cytcen setName:@"cytcen"];
    [self addChild:cytcen];
    
    [[self childNodeWithName:@"Line"] removeFromParent];
    
    CGPoint path[] = {
        CGPointMake(0,0),
        pos
    };
    
    SKShapeNode * line =  [SKShapeNode shapeNodeWithSplinePoints:path
                                                           count:2];
    [line setLineWidth:10];
    [line setStrokeColor: [UIColor greenColor]];
    [line setName:@"Line"];
    
    [self addChild:line];
}


@end
