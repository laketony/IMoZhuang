//
//  GameViewController.m
//  LTGameIMoZhuan
//
//  Created by Laketony on 2018/10/24.
//  Copyright © 2018年 Laketony. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"

@implementation GameViewController{
    
    __weak IBOutlet UIImageView *iv_fgview;
    __weak IBOutlet UIImageView *iv_bgview;
    
    __weak IBOutlet SKView *gameview;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Load the SKScene from 'GameScene.sks'
    GameScene *scene = (GameScene *)[SKScene nodeWithFileNamed:@"GameScene"];
    
    // Set the scale mode to scale to fit the window
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    SKView *skView = self->gameview;
    
    // Present the scene
    [skView presentScene:scene];
    
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    int row = rand()%20+1;
    [iv_bgview setImage: [UIImage imageNamed:[NSString stringWithFormat:@"map_%d.png",row]]];
    [iv_fgview setImage: [UIImage imageNamed:[NSString stringWithFormat:@"map_%d_d.png",row]]];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
