//
//  CowController.m
//  Cow
//
//  Created by PSME STUDENTS on 7/18/13.
//  Copyright (c) 2013 PSME STUDENTS. All rights reserved.
//

#import "CowController.h"
#import <Foundation/Foundation.h>

#define IMAGE_COUNT 6

@implementation CowController{
    UIButton *_button;
    bool _direction;
    int _currentImageIndex;
    NSMutableArray *_images;
}

- (id) initWithButton: (UIButton*) button {
    id newInstance = [super init];
    if(newInstance) {
        _button = button;
        _currentImageIndex = 0;
        _images = [[NSMutableArray alloc] init];
        for(int i = 0; i < IMAGE_COUNT; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"cow-%d.png", i]];
            if (image != nil){
                [_images addObject: image];
            }
        
        }
    }
    return newInstance;
}

-(void) next {
    UIImage *image = [_images objectAtIndex: _currentImageIndex];
    [_button setImage : image forState: UIControlStateNormal];
    if(_direction == YES) { 
        if(_currentImageIndex == [_images count] - 1) {
            _currentImageIndex = 0;
        }
       else _currentImageIndex++;
    }
    else {
        if(_currentImageIndex == 0) {
            _currentImageIndex = [_images count] - 1;
        }
        else _currentImageIndex--;
    }
}

-(void) setDirection: (bool) direction {
    _direction = direction;
}

-(void)dealloc{
    _images = nil;
}

@end
