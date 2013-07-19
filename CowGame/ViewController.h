//
//  ViewController.h
//  CowGame
//
//  Created by IOS Student on 7/18/13.
//  Copyright (c) 2013 edu.foothill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (weak, nonatomic) IBOutlet UIButton *buttonLeft;
@property (weak, nonatomic) IBOutlet UIButton *buttonRight;

-(IBAction)onCowClick:(id)sender;
-(IBAction)onDirectionClick:(id)sender;

@end
