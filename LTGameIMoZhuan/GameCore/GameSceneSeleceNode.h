//
//  GameSceneSeleceNode.h
//  LTGameIMoZhuan
//
//  Created by Laketony on 2018/10/26.
//  Copyright © 2018年 Laketony. All rights reserved.
//

#import "GameSceneTouchCtrl.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameSceneSeleceNode : GameSceneTouchCtrl
{
    //bad vs good 这个命名 选自与 dota2和我的英雄学院
    //区别于 魔兽 联盟部落这样的命名设定更直接
    //虽然 在 dota中的 天灾 和 夜x
    //但是 bad 和 good 更应该被翻译成 友军 和 敌人
    //这里取名还避开了 红色警戒的 苏联,盟军,尤里
    //后期会追加中立单位
    
    //敌人数组 bad 敌人
    NSMutableArray *bNode;
    
    //友军数组 good 好人
    NSMutableArray *gNode;
}


-(PlayerNode *)nodeInGoodTeamAtPoint:(CGPoint)p;
-(BaseNode *)nodeInBadTeamAtPoint:(CGPoint)p;
@end

NS_ASSUME_NONNULL_END
