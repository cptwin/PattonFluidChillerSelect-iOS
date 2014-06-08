//
//  ContactsViewController.m
//  Fluid Chiller Select
//
//  Created by Kerry Powell on 3/04/14.
//  Copyright (c) 2014 Patton. All rights reserved.
//

#import "ContactsViewController.h"

@interface ContactsViewController ()

@end

@implementation ContactsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self registerLabelGesture:labelPhoneNz action:@selector(makePhoneCall:)];
    [self registerLabelGesture:labelPhoneAu action:@selector(makePhoneCall:)];
    [self registerLabelGesture:labelPhoneTh action:@selector(makePhoneCall:)];
    [self registerLabelGesture:labelPhoneIn action:@selector(makePhoneCall:)];
    [self registerLabelGesture:labelEmailNz action:@selector(createEmail:)];
    [self registerLabelGesture:labelEmailAu action:@selector(createEmail:)];
    [self registerLabelGesture:labelEmailTh action:@selector(createEmail:)];
    [self registerLabelGesture:labelEmailIn action:@selector(createEmail:)];
    [self registerLabelGesture:labelWebNz action:@selector(goToWebpage:)];
    [self registerLabelGesture:labelWebAu action:@selector(goToWebpage:)];
    [self registerLabelGesture:labelWebTh action:@selector(goToWebpage:)];
    [self registerLabelGesture:labelWebIn action:@selector(goToWebpage:)];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [scrollView setScrollEnabled:YES];
    CGRect scrollBounds = scrollView.bounds;
    scrollBounds.size.height = background.bounds.size.height;
    scrollView.frame = scrollBounds;
    [scrollView setContentSize:CGSizeMake(scrollingView.bounds.size.width, scrollingView.bounds.size.height)];
    
    
}

// Method that will create a UITapGestureRecogniser for each label as they one TGR cannot be reused for each action :(
- (void) registerLabelGesture:(UILabel *)label action:(SEL)action
{
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:action];
    [label setUserInteractionEnabled:true];
    [label addGestureRecognizer:gesture];
}

// Method to extract text from the label
+ (NSString *)getText:(UIView *)view
{
    if([view isKindOfClass:[UILabel class]])
    {
        return [(UILabel *)view text];
    }
    return nil;
}

// Method to call the given action
+ (void)doAction:(NSString *) action withView:(UIView *)view
{
    NSString *text = [self.class getText:view];
    if(text != nil)
    {
        action = [action stringByAppendingString:text];
        NSLog(@"%@%@", @"Action:", action);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:action]];
    }
}

- (void)makePhoneCall:(UITapGestureRecognizer*)recognizer
{
    //telprompt://
    //[self.class doAction:@"tel:" withView:recognizer.view];
    [self.class doAction:@"telprompt://" withView:recognizer.view];
}

- (void)goToWebpage:(UITapGestureRecognizer *) recognizer
{
    [self.class doAction:@"http://" withView:recognizer.view];
}

- (void)createEmail:(UITapGestureRecognizer *) recognizer
{
    //[self.class doAction:@"mailto:" withView:recognizer.view];
    
    NSString *recipient = [self.class getText:recognizer.view];
    
    // Email Subject
    NSString *emailTitle = @"Chiller Select Enquiry";
    // Email Content
    //NSString *messageBody = @"";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:recipient];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    //[mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}


@end
