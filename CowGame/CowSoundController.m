//
//  CowSoundController.m
//  CowGame
//
//  Created by IOS Student on 7/18/13.
//  Copyright (c) 2013 edu.foothill. All rights reserved.
//

#import "CowSoundController.h"
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

#define SOUND_COUNT 3

@implementation CowSoundController{
    int _currentSoundIndex;
    NSMutableArray *_soundArray;
    AVQueuePlayer *_audioPlayer;
    bool _isPlaying;
}

+(id)init{
    return [[CowSoundController alloc] init];
}

-(id)init{
    id newInstance = [super init];
    if(newInstance)
    {
        _isPlaying = false;
        
        _soundArray = [[NSMutableArray alloc]init];
        for (int i=0; i < SOUND_COUNT; i++) {
            NSString *filename = [NSString stringWithFormat: @"audio-%d", i+1];
            NSURL *path = [[NSBundle mainBundle] URLForResource:filename
                                                  withExtension:@"wav"];
            [_soundArray addObject:path];
        }
        
        _audioPlayer = [[AVQueuePlayer alloc] init ];
        @try {            
            [[NSNotificationCenter defaultCenter]   addObserver:self
                                                    selector:@selector(playerItemDidReachEnd:)
                                                    name:AVPlayerItemDidPlayToEndTimeNotification
                                                    object:nil];
            //[[NSNotificationCenter defaultCenter] postNotificationName:AVPlayerItemDidPlayToEndTimeNotification
              //                                      object:nil];
        }
        @catch (NSException *exception) {
            NSLog(@"CowSoundController: %@", exception);
        }
        [self playerItemDidReachEnd:nil];

    }
    
    return newInstance;
}


- ( void ) playerItemDidReachEnd: ( NSNotification * ) notification {
    if (!_isPlaying){
        return;
    }
    
    [self addSoundItem];
    
}

-(void)addSoundItem{
    if (_currentSoundIndex == SOUND_COUNT){
        _currentSoundIndex = 0;
    }
    
    @try {
        AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:[_soundArray objectAtIndex:_currentSoundIndex]];
        [ _audioPlayer insertItem: playerItem afterItem: nil ];
        playerItem = nil;
    }
    @catch (NSException *exception) {
        NSLog(@"addSoundItem: %@\n", exception);
    }
    _currentSoundIndex++;
}

-(void)start{
    if (_audioPlayer != nil){
        _isPlaying = true;

        if ([_audioPlayer currentItem] == nil){
            [self addSoundItem];
        }
        
        [_audioPlayer play];
    }
}

-(void)stop{
    if (_audioPlayer != nil)
    {
        _isPlaying = false;
        [_audioPlayer pause];
        
    }
}

-(void)dealloc {
    NSLog(@"Deallocating...");
    _audioPlayer = nil;
}

@end
