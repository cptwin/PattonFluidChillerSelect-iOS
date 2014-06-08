//
//  ContactsViewController.h
//  Fluid Chiller Select
//
//  Created by Kerry Powell on 3/04/14.
//  Copyright (c) 2014 Patton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ContactsViewController : UIViewController <MFMailComposeViewControllerDelegate>
{
    IBOutlet UILabel *labelPhoneNz;
    IBOutlet UILabel *labelEmailNz;
    IBOutlet UILabel *labelWebNz;
    IBOutlet UILabel *labelPhoneAu;
    IBOutlet UILabel *labelEmailAu;
    IBOutlet UILabel *labelWebAu;
    IBOutlet UILabel *labelPhoneTh;
    IBOutlet UILabel *labelEmailTh;
    IBOutlet UILabel *labelWebTh;
    IBOutlet UILabel *labelPhoneIn;
    IBOutlet UILabel *labelEmailIn;
    IBOutlet UILabel *labelWebIn;
    IBOutlet UIScrollView *scrollView;
    IBOutlet UIView *background;
    IBOutlet UIView *scrollingView;
}

+ (void)doAction:(NSString *) action withView:(UIView *)view;
- (void)makePhoneCall:(UITapGestureRecognizer *)recognizer;
- (void)goToWebpage:(UITapGestureRecognizer *)recognizer;
- (void)createEmail:(UITapGestureRecognizer *)recognizer;

@end
