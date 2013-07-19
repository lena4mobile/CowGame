//
//  CowBackdropController.h
//  CowGame
//
//  Created by IOS Student on 7/18/13.
//  Copyright (c) 2013 edu.foothill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CowBackdropController  : NSObject

+(id)initWithScrollView:(UIScrollView*)scrollView;
-(void)next;
-(Boolean)getDirection;
-(void)setDirection:(Boolean)direction;
-(void)setLoop:(Boolean)loop;
-(Boolean)getLoop;

@end
