//
//  MainViewController.m
//  Fluid Chiller Select
//
//  Created by Kerry Powell on 2/04/14.
//  Copyright (c) 2014 Patton. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () <UIActionSheetDelegate>
- (IBAction)showFluidTypeAction:(id)sender;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *headerImg = [UIImage imageNamed:@"ic_header_and_icon-web.png"];
    //[headerImg drawInRect:CGRectMake(0, 0, 227, 44)];
    //UIImage *scaledHeaderImg = UIGraphicsGetImageFromCurrentImageContext();
    //UIGraphicsEndImageContext();
    UIImageView *headerImgView = [[UIImageView alloc] initWithImage:headerImg];
    [headerImgView setContentMode:UIViewContentModeScaleAspectFit];

    [[self navigationItem] setTitleView:headerImgView];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    double PZBS325W[] = {2.95,3.09,3.23,3.37,3.51,3.65,3.81,3.97,4.13,4.29,4.45,4.65,4.85,5.05,5.25,5.45,5.68,5.91,6.14,6.37,6.60,6.87,7.14,7.41,7.68,7.95};
    double PZB350W[] = {3.66,3.84,4.03,4.22,4.41,4.60,4.77,4.94,5.11,5.28,5.45,5.69,5.93,6.17,6.41,6.65,6.88,7.11,7.34,7.57,7.80,8.11,8.42,8.73,9.04,9.35};
    double PZB400W[] = {4.75,4.95,5.15,5.35,5.55,5.75,5.97,6.19,6.41,6.63,6.85,7.13,7.41,7.69,7.97,8.25,8.55,8.85,9.16,9.46,9.76,7.30,7.60,7.90,8.20,11.20};
    double PZB500W[] = {5.65,5.89,6.13,6.37,6.61,6.85,7.11,7.37,7.63,7.89,8.15,8.50,8.88,9.26,9.64,10.02,10.52,10.84,11.18,11.50,11.83,12.20,12.60,13.00,13.40,13.80};
    double PZB600W[] = {7.20,7.50,7.80,8.10,8.39,8.68,9.00,9.32,9.63,9.94,10.25,10.67,11.09,11.51,11.93,12.35,12.73,13.11,13.49,13.87,14.25,14.66,15.07,15.48,15.89,16.30};
    double PZB650W[] = {7.70,8.06,8.42,8.78,9.14,9.50,9.95,10.40,10.85,11.30,11.75,12.30,12.80,13.30,13.81,14.32,14.79,15.26,15.73,16.20,16.67,17.19,17.73,18.27,18.81,19.35};
    double PZB800W[] = {9.50,9.94,10.36,10.78,11.20,11.62,12.02,12.44,12.86,13.28,13.70,14.30,14.88,15.46,16.04,16.62,17.15,17.70,18.25,18.80,19.35,20.00,20.70,21.40,22.10,22.80};
    double PZB900W[] = {11.25,11.68,12.11,12.54,12.97,13.40,14.02,14.44,14.86,15.34,15.82,16.46,17.09,17.72,18.35,18.98,19.66,20.32,20.98,21.64,22.30,22.95,23.58,24.21,24.85,25.48};
    double PZB1000W[] = {13.25,13.70,14.18,14.66,15.14,15.62,16.18,16.76,17.34,17.92,18.50,19.18,19.91,20.62,21.33,22.04,22.77,23.50,24.23,24.96,25.69,26.48,27.30,28.12,28.94,29.76};
    double PZB1200W[] = {15.05,15.58,16.11,16.64,17.17,17.70,18.35,19.03,19.71,20.39,21.07,21.87,22.64,23.41,24.18,24.95,25.87,26.79,27.71,28.63,29.55,30.49,31.41,32.33,33.25,34.17};
    double PZB1300W[] = {17.30,17.83,18.37,18.91,19.45,19.99,20.59,21.19,21.79,22.39,22.99,23.71,24.43,25.15,25.87,26.59,27.48,28.37,29.26,30.15,31.04,32.06,33.06,34.06,35.06,36.06};
    double PZB1500W[] = {19.00,19.73,20.46,21.20,21.94,22.68,23.48,24.27,25.06,25.85,26.64,27.72,28.78,29.84,30.90,31.96,33.10,34.20,35.30,36.40,37.50,38.73,39.94,41.15,42.36,43.57};

    [self assignEngineArrays:0 data:PZBS325W];
    [self assignEngineArrays:1 data:PZB350W];
    [self assignEngineArrays:2 data:PZB400W];
    [self assignEngineArrays:3 data:PZB500W];
    [self assignEngineArrays:4 data:PZB600W];
    [self assignEngineArrays:5 data:PZB650W];
    [self assignEngineArrays:6 data:PZB800W];
    [self assignEngineArrays:7 data:PZB900W];
    [self assignEngineArrays:8 data:PZB1000W];
    [self assignEngineArrays:9 data:PZB1200W];
    [self assignEngineArrays:10 data:PZB1300W];
    [self assignEngineArrays:11 data:PZB1500W];
    
    engineNames[0] = @"PZBS325W";
    engineNames[1] = @"PZB350W";
    engineNames[2] = @"PZB400W";
    engineNames[3] = @"PZB500W";
    engineNames[4] = @"PZB600W";
    engineNames[5] = @"PZB650W";
    engineNames[6] = @"PZB800W";
    engineNames[7] = @"PZB900W";
    engineNames[8] = @"PZB1000W";
    engineNames[9] = @"PZB1200W";
    engineNames[10] = @"PZB1300W";
    engineNames[11] = @"PZB1500W";
    
    fluid = [[FluidType alloc] init];
    [self resetDefaults];
    // Do any additional setup after loading the view.
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected)];
    singleTap.numberOfTapsRequired = 1;
    resetButton.userInteractionEnabled = YES;
    [resetButton addGestureRecognizer:singleTap];
}

-(void)tapDetected{
    [self resetDefaults];
}

- (void)assignEngineArrays:(int)index data:(double[26])engine
{
    for (int i = 0; i < 26; i++) {
        engines[index][i] = engine[i];
    }
}

- (void)resetDefaults
{
    [fluid reset];
    [fluidTypeButton setTitle:[fluid getName] forState: UIControlStateNormal];
    [tempInTextField setText:@"4"];
    [tempOutTextField setText:@"2"];
    [volumeTextField setText:@"10000"];
    [runtimeTextField setText:@"1"];
    [self performCalculation];
}

- (void)clearCalulated
{
    [capactiryTextField setText:@""];
    [modelTextField setText:@""];
}

- (void)performCalculation
{
    if (![self isError]) {
        [capactiryTextField setText:[self calculateVolume]];
        NSString *model = [self getModel];
        [modelTextField setText:model];
        NSLog(@"%@", model);
        if ([model rangeOfString:@"ERROR"].location != NSNotFound)
        {
            [self setViewError:modelView];
            [modelTextField setText:@""];
        }
    } else
    {
        [self clearCalulated];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDefaultColors
{
    [self setViewDefault:fluidView isLight:false];
    [self setViewDefault:tempInView isLight:true];
    [self setViewDefault:tempOutView isLight:false];
    [self setViewDefault:volumeView isLight:true];
    [self setViewDefault:runtimeView isLight:false];
    [self setViewDefault:capView isLight:true];
    [self setViewDefault:modelView isLight:false];
    
}

- (NSString *)calculateVolume
{
    double volume = [[volumeTextField text] doubleValue];
    double tempIn = [[tempInTextField text] doubleValue];
    double tempOut = [[tempOutTextField text] doubleValue];
    double runTime = [[runtimeTextField text] doubleValue];
    double result = volume * [fluid getValue] * (tempIn - tempOut) / (runTime * 3.6) / 1000;
    return [NSString stringWithFormat:@"%.2f", round(2.0f * result) / 2.0f];
}

- (NSString *)getModel
{
    int tempOut = [[tempOutTextField text] intValue];
    int tempIn = [[tempInTextField text] intValue];
    double capacity = [[capactiryTextField text] doubleValue];
    if (tempOut < [fluid getLowestAllowedTemp])
    {
        [self outputError:[@"Fluid Out temp is too low for " stringByAppendingString:[fluid getName]]];
        return [@"ERROR Fluid Out temp is too low for " stringByAppendingString:[fluid getName]];
    } else if(tempOut > tempIn)
    {
        [self outputError:@"Input temp is higher than output!"];
        return @"ERROR Input temp is higher than output!";
    }
    
    int position = tempOut + 14; // - 6k + 20(array index allignment) = 14
    if (position < 0 || position >= 26)
    {
        [self outputError:@"No models meet criteria!"];
        return @"ERROR No models in database meet Criteria";
    }
    
    NSString *model;
    for (int i = 0; i < 12 && model == nil; i++)
    {
        if (engines[i][position] >= capacity && engines[i][25] >= capacity)
        {   //if the capacity is larger than the maximum capacity of the engine
            model = engineNames[i];
        }
    }
    
    if (model == nil)
    {
        [self outputError:@"No models meet criteria!"];
        return @"ERROR No models in database meet Criteria";
    } else
    {
        return model;
    }
}

-(void) outputError:(NSString*) errorMessage
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    
	// Configure for text only and offset down
	hud.mode = MBProgressHUDModeText;
	hud.labelText = errorMessage;
	hud.margin = 10.f;
	hud.yOffset = -150.f;
	hud.removeFromSuperViewOnHide = YES;
    
	[hud hide:YES afterDelay:1];
}

- (bool)isError
{
    [self setDefaultColors];
    bool result = false;
    if([[runtimeTextField text] doubleValue] > 24)
    {
        [self outputError:@"Runtime is larger than 24 hours!"];
        [self setViewError:runtimeView];
        result = true;
    }
    if([[volumeTextField text] doubleValue] > 100000)
    {
        [self outputError:@"Volume is too large!"];
        [self setViewError:volumeView];
        result = true;
    }
    if([[tempInTextField text] doubleValue] <= [[tempOutTextField text] doubleValue])
    {
        [self outputError:@"Temp In is lower than Temp Out!"];
        [self setViewError:tempInView];
        [self setViewError:tempOutView];
        result = true;
    }
    if([[tempOutTextField text] integerValue] < [fluid getLowestAllowedTemp])
    {
        [self outputError:[@"Temp Out is to low for " stringByAppendingString:[fluid getName]]];
        [self setViewError:tempOutView];
        result = true;
    }
    
    return result;
}

- (void)setViewError:(UIView *)view
{
    [view setBackgroundColor:[UIColor redColor]];
}

- (void)setViewDefault:(UIView *)view isLight:(bool) light
{
    if (light)
    {
        [view setBackgroundColor:[UIColor colorWithRed:0/255.0 green:161/255.0 blue:225/255.0 alpha:1.0]];
    } else
    {
        [view setBackgroundColor:[UIColor colorWithRed:9/255.0 green:121/255.0 blue:191/255.0 alpha:1.0]];
    }
}

- (IBAction)showFluidTypeAction:(id)sender {
    NSArray *fluids = [fluid getNameArray];
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self
                                                     cancelButtonTitle:nil
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:nil];
    for(NSString *fluidName in fluids)  {
        if(![fluidName  isEqual: @"Unknown Type"])
        {
            [actionSheet addButtonWithTitle:fluidName];
        }
    }
    
    [actionSheet addButtonWithTitle:@"Cancel"];
    
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonSelected = [actionSheet buttonTitleAtIndex:buttonIndex];
    if(![buttonSelected isEqual: @"Cancel"])
    {
        [fluidTypeButton setTitle:[actionSheet buttonTitleAtIndex:buttonIndex] forState:UIControlStateNormal];
        [fluid setType:[actionSheet buttonTitleAtIndex:buttonIndex]];
        [self performCalculation];
    }
}
- (IBAction)inTempChanged:(id)sender {
    [self performCalculation];
}

- (IBAction)outTempChanged:(id)sender {
    [self performCalculation];
}

- (IBAction)volumeChanged:(id)sender {
    [self performCalculation];
}

- (IBAction)runtimeChanged:(id)sender {
    [self performCalculation];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [tempInTextField resignFirstResponder];
    [tempOutTextField resignFirstResponder];
    [volumeTextField resignFirstResponder];
    [runtimeTextField resignFirstResponder];
}
@end
