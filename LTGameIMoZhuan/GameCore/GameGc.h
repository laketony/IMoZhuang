//
//  GameGc.h
//  LTGameIMoZhuan
//
//  Created by Laketony on 2018/10/29.
//  Copyright © 2018年 Laketony. All rights reserved.
//

#ifndef GameGc_h
#define GameGc_h

@protocol GameGC <NSObject>

-(void)attackFrom:(SKNode*)attacker_node tagers:(NSArray *)tagers_node;

@end

#endif /* GameGc_h */
