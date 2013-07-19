//
//  ViewController.m
//  CowGame
//
//  Created by IOS Student on 7/18/13.
//  Copyright (c) 2013 edu.foothill. All rights reserved.
//

#import "ViewController.h"
#import "CowController.h"
#import "CowSoundController.h"
#import "CowBackdropController.h"

@interface ViewController ()

@end

@implementation ViewController

NSTimer *timer;
bool isRunning;

CowSoundController *sound;
CowController *cow;
CowBackdropController *backdrop;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"Initializing\n");
    @try{
        sound = [CowSoundController init];
        cow = [[CowController alloc]initWithButton:_button];
        backdrop = [CowBackdropController initWithScrollView:_scrollView];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.16f
                                               target:self
                                               selector:@selector(onTick:)
                                               userInfo:nil
                                               repeats:YES];
    }@catch (NSException *ex) {
        NSLog(@"%@", ex);
    }@finally {
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction)onCowClick:(id)sender{
    NSLog(@"onCowClick");
    
    isRunning = !isRunning;
    if (isRunning){
        NSLog(@"start\n");
        [sound start];
    }else{
        NSLog(@"stop\n");
        [sound stop];
    }
}

-(void)onTick:(NSTimer*)timer{
    NSLog(@"onTick\n");
    if (isRunning) {
        
        NSLog(@"next step\n");

        [backdrop next];
        bool forward = [backdrop getDirection];
        if (forward){
            NSLog(@" -> \n");
        }else{
            NSLog(@" <- \n");
        }
        
        [cow setDirection:forward];
        [cow next];
        
    }
        
    
}

@end
