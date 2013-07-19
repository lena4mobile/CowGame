//
//  CowController.h
//  Cow
//
//  Created by PSME STUDENTS on 7/18/13.
//  Copyright (c) 2013 PSME STUDENTS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CowController : NSObject
-(id) initWithButton : (UIButton*) button;
-(void) next;
-(void) setDirection: (bool) direction;
@end
