//
//  SPNodeFactory.h
//  LTGameIMoZhuan
//
//  Created by Laketony on 2018/10/27.
//  Copyright © 2018年 Laketony. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameNodes.h"

NS_ASSUME_NONNULL_BEGIN

@interface SPNodeFactory : NSObject

//[SPNodeFactory playOne:@"g_t_weapon_hpfy" head:@"g_t_helmet_lf" body:@"g_t_back_lf"];
+(PlayerNode*)playOne:(NSString *)wuqi
                 head:(NSString *)head
                 body:(NSString *)body;

@end

NS_ASSUME_NONNULL_END
