//
//  MainViewController.h
//  Fluid Chiller Select
//
//  Created by Kerry Powell on 2/04/14.
//  Copyright (c) 2014 Patton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FluidType.h"
#import "MBProgressHUD.h"

@interface MainViewController : UIViewController
{
    
    IBOutlet UIButton *fluidTypeButton;
    IBOutlet UITextField *tempInTextField;
    IBOutlet UITextField *tempOutTextField;
    IBOutlet UITextField *volumeTextField;
    IBOutlet UITextField *runtimeTextField;
    IBOutlet UITextField *capactiryTextField;
    IBOutlet UITextField *modelTextField;
    
    IBOutlet UIView *fluidView;
    IBOutlet UIView *tempInView;
    IBOutlet UIView *tempOutView;
    IBOutlet UIView *volumeView;
    IBOutlet UIView *runtimeView;
    IBOutlet UIView *capView;
    IBOutlet UIView *modelView;
    
    IBOutlet UIImageView *resetButton;
    
    FluidType *fluid;
    double engines[12][26];
    NSString *engineNames[12];
}
- (IBAction)inTempChanged:(id)sender;
- (IBAction)outTempChanged:(id)sender;
- (IBAction)volumeChanged:(id)sender;
- (IBAction)runtimeChanged:(id)sender;
- (void) outputError: (NSString*)errorMessage;

@end
