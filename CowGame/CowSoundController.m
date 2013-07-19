//
//  CowSoundController.m
//  CowGame
//
//  Created by IOS Student on 7/18/13.
//  Copyright (c) 2013 edu.foothill. All rights reserved.
//

#import "CowSoundController.h"
#import "AudioToolbox/AudioToolbox.h"
#define SOUND_COUNT 1


@implementation CowSoundController{
    int _currentSoundIndex;
    NSMutableArray *_soundArray;
}

+(id)init{
    return [[CowSoundController alloc] init];
}

-(id)init{
    id newInstance = [super init];
    if(newInstance)
    {
        _soundArray = [[NSMutableArray alloc] initWithCapacity:SOUND_COUNT];
        for (int i=0; i < SOUND_COUNT; i++) {
            NSString *filename = [NSString stringWithFormat: @"audio-%d", i+1];
            
            NSString *soundFile = [[NSBundle mainBundle]
                                   pathForResource:filename ofType:@"wav"];
            SystemSoundID soundId;
            AudioServicesCreateSystemSoundID((__bridge CFURLRef)
                                             [NSURL fileURLWithPath:soundFile], &soundId);
            [_soundArray addObject:[NSNumber numberWithLong:soundId]];
        }
        _currentSoundIndex = 0;
    }
    
    return newInstance;
}

-(void)start{

}

-(void)stop{

}

@end
