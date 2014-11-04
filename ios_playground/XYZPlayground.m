//
//  XYZPlayground.m
//  ios_playground
//
//  Created by Nate on 10/29/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "XYZPlayground.h"
#import <SpriteKit/SpriteKit.h>
#import "BRWDazeParticle.h"

@interface XYZPlayground ()
@property (nonatomic) SKScene *scene;
@property (nonatomic) NSMutableArray *dazeEffects;
@property (nonatomic) BRWDazeParticle *daze;
@end

@implementation XYZPlayground

- (void)run
{
    [self runSpriteKit];
}

- (void)runSpriteKit
{
    // add view
    SKView *view = [[SKView alloc] initWithFrame:self.worksheetView.frame];
    [view setBackgroundColor:[UIColor lightGrayColor]];
    [self.worksheetView addSubview:view];
    
    // add sceen
    SKScene *scene = [SKScene sceneWithSize:view.frame.size];
    [scene setAnchorPoint:CGPointMake(.5, .5)];
    [scene setBackgroundColor:[UIColor lightGrayColor]];
    [view presentScene:scene];
    _scene = scene;
    
    [self runDaze];
}

- (void)runDaze
{
    _daze = [[BRWDazeParticle alloc] init];
    [_scene addChild:_daze];
    
    KZPAdjustValue(waveSpeed, 0.0f, 1.0f);
    KZPAdjustValue(waveRadius, 1, 10);
    KZPAdjustValue(rotateSpeed, 0.0f, M_PI);
    
    KZPAnimate(^{
        [_daze updateWithTime:.01f];
    });
}


@end
