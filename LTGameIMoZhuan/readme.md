# 魔装记
是我对青年时代,魔兽世界的一份简化的追忆.
不奢求能够复原,魔兽世界的宏大故事背景和史诗级游戏体验.
# ----------------------------------
游戏主要分为了 3种角色,
魔王,杂兵,勇者

魔王就是被群殴的BOSS.
杂兵就是路上的金币,
勇者就是玩家,所有的勇者都是从被蹂躏到蹂躏进化的.

## Boss的设计初衷
Boss要保证不能被装备碾压,
所以 :
    BOSS最少会由十次事件组成,任意9次事件错误,玩家或玩家团队必然灭亡
    BOSS每3次事件组合会有减员风险.
    终极Boss最多会有100次事件
    精英Boss最多会有50次事件
    普通Boss最多由20次事件
## Boss的AI 是事件逻辑的基础,当然Boss也有非AI事件
Boss事件:   
    Boss可以有无限多的事件,这个由设计团决定;
    
    
    
# 控制
控制分为:
    镜头与场景的控制,
    人物与场景的控制,
    
游戏的基层为场景

场景上 存在精灵
精灵分为魔王 杂兵 勇者 杂物,
杂物分为可站立杂物 与 排斥杂物
杂物分为可清除杂物 与 不可清除杂物
杂物可以根据 不同的事物清除,比如BOSS的某些焚烧技能,会清除木头,玩家的采集能力能清除碳

# 公式

精灵变量
表象属性
力量 智力 敏捷 精神 耐力 命中 暴击 暴击伤害
计算属性
攻击力: 
        法伤:智力 
        物伤:
防御力:
躲避率:招架、躲闪
生命力:
魔法力:
攻击速度:
    攻击间隔 标准的为1秒   提升攻击速度的公式 为  1/(1+x)  点数计算公式为 350/350
    e.g. 风之弓 提升 敏捷

命中
精准
暴击
暴击伤害 默认为2



