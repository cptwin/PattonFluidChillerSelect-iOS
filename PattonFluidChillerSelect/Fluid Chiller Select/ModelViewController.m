//
//  ModelViewController.m
//  Fluid Chiller Select
//
//  Created by Kerry Powell on 7/04/14.
//  Copyright (c) 2014 Patton. All rights reserved.
//

#import "ModelViewController.h"

@interface ModelViewController ()

@end

@implementation ModelViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //NSLog(@"availableLocaleIdentifiers: %@", [NSLocale ISOCountryCodes]);
    NSLocale *currentLocale = [NSLocale currentLocale];
    NSString *countryCode = [currentLocale objectForKey:NSLocaleCountryCode];
    //NSLog(@"iPhone Currently in %@", countryCode);
    NSString *fullURL = @"http://www.pattonnz.com/pdf/techBrochure/PattonPak_PZB%20Water%20Chiller_NZ.pdf";
    if([countryCode isEqual: @"AU"])
    {
        fullURL = @"http://www.pattonau.com/pdf/techBrochure/PattonPak_PZB%20Water%20Chiller_NZ.pdf";
    }
    else if ([countryCode isEqual: @"TH"])
    {
        fullURL = @"http://www.pattonth.com/pdf/techBrochure/PattonPak_PZB%20Water%20Chiller_NZ.pdf";
    }
    else if ([countryCode isEqual: @"IN"])
    {
        fullURL = @"http://www.pattonin.com/pdf/techBrochure/PattonPak_PZB%20Water%20Chiller_NZ.pdf";
    }
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
