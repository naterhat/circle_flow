//
//  DazeParticle.m
//  ios_playground
//
//  Created by Nate on 11/1/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "BRWDazeParticle.h"

static CGFloat kWidth = 40;
static CGFloat kHeight = 20;
static CGFloat kWaveRadius = 10;

@interface BRWDazeParticle ()
{
    NSMutableArray *_particles;
    CGFloat _wave;
    CGFloat _offset;
    CGFloat _seperationRadian;
    uint _particlesCount;
    CGFloat _x, _y, _rad; // temporary variables
    NSTimeInterval _elapse;
}
@end

@implementation BRWDazeParticle


- (instancetype)init
{
    if(self = [super init]) {
        _wave = 0;
        _offset = 0;
        _x = 0;
        _y = 0;
        _waveSpeed = .95;
        _rotateSpeed = 3.0f;
        _duration = 3.0f;
        _elapse = _duration;
        
        const uint count = 20;
        _particles = [NSMutableArray arrayWithCapacity:count];
        for (int i = 0; i < count; i++) {
            _particles[i] = [SKSpriteNode spriteNodeWithImageNamed:@"dazzed_effect"];
            [self addChild:_particles[i]];
            
            CGFloat scale = i < count * .5f ? (count - i)/(float)count :  i/(float)count ;
            scale = (scale * 2.0f ) + .5f;
            [_particles[i] setScale:scale];
        }
        
        _particlesCount = count;
        _seperationRadian = M_PI * 2 / ((float)_particlesCount);
    } return self;
}

- (void)setDuration:(NSTimeInterval)duration
{
    _duration = _elapse;
    _elapse = _duration;
}

- (void)updateWithTime:(NSTimeInterval)deltaTime
{
    // increment iVars
    _offset += _rotateSpeed * deltaTime;
    _wave += _waveSpeed * deltaTime;
    
    _elapse -= deltaTime;
    if(_elapse < 0){
        _elapse = _duration;
    }
    
    _rad = 0;
    
    // this will
    CGFloat lifeFactor = _elapse / _duration;
    
    
    for (uint i = 0; i < _particlesCount; i++) {
        _rad = (i * _seperationRadian) +  (_offset);
        _x = cos(_rad) * kWidth;
        _y = (sin(_rad) * kHeight) + (sin(_wave) * kWaveRadius);
        
        SKNode *node = _particles[i];
        [node setPosition:CGPointMake(_x,_y)];
        
        CGFloat reverseParticleIndexFactor = (_particlesCount - i)/(float)_particlesCount;
        
        // set alpah
        if(reverseParticleIndexFactor > lifeFactor) [node setAlpha:0];
        else [node setAlpha:1];
        
        // this will make a wave by increase at every iteration.
        _wave += _waveSpeed;
    }
}

- (void)destroyObject
{
    
}

- (void)setLimit:(CGFloat)limit
{
    
}


@end
