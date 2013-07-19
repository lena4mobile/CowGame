//
//  CowBackdropController.m
//  CowGame
//
//  Created by IOS Student on 7/18/13.
//  Copyright (c) 2013 edu.foothill. All rights reserved.
//

#import "CowBackdropController.h"
#import <Foundation/Foundation.h>

#define DELTA_OFFSET 10


@implementation CowBackdropController{
    UIScrollView* _scrollView;
    bool _direction;
    bool _loop;
}

+(id)initWithScrollView:(UIScrollView*)scrollView{
    return [[CowBackdropController alloc] initWithScrollView:scrollView];
}

-(id)initWithScrollView:(UIScrollView*)scrollView{
    id newInstance = [super init];
    if (newInstance){
        _direction = true;
        _scrollView = scrollView;
        
        CGPoint topOffset = CGPointMake(0, 0);
        [_scrollView setContentOffset:topOffset animated:YES];
    }
    return newInstance;
}

-(void)next{
    CGPoint scrollOffset = [_scrollView contentOffset];
    
    CGFloat imageWidth = [_scrollView contentSize].width;
    CGFloat scrollWidth = [_scrollView bounds].size.width;
    
    //right edge ->
    if (imageWidth - scrollOffset.x <= scrollWidth  && _direction)
    {
        if (_loop){
            _direction = !_direction;
        }else{
            scrollOffset.x = 0;
        }
        
    }
    
    //left edge <-
    if (scrollOffset.x < 0 && !_direction)
    {
        if (_loop){
            _direction = !_direction;
        }else{
            scrollOffset.x = imageWidth - scrollWidth;
        }
    }
    
    if (_direction){
        scrollOffset.x += DELTA_OFFSET;
    }else{
        scrollOffset.x -= DELTA_OFFSET;
    }
    
    [_scrollView setContentOffset:scrollOffset animated:NO];
}

-(Boolean)getDirection{
    return _direction;
}

-(void)setDirection:(Boolean)direction{
    _direction = direction;
}

-(void)setLoop:(Boolean)loop{
    _loop = loop;
}

-(Boolean)getLoop{
    return  _loop;
}

@end
