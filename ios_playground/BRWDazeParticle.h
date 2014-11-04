//
//  DazeParticle.h
//  ios_playground
//
//  Created by Nate on 11/1/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BRWDazeParticle : SKNode
@property (nonatomic) CGFloat limit;
@property (nonatomic) CGFloat waveSpeed;
@property (nonatomic) CGFloat rotateSpeed;
@property (nonatomic) NSTimeInterval duration;
- (void)updateWithTime:(NSTimeInterval)deltaTime;


@end
