//
//  UITextFieldPicker.m
//  Fluid Chiller Select
//
//  Created by Kerry Powell on 2/04/14.
//  Copyright (c) 2014 Patton. All rights reserved.
//

#import "UITextFieldPicker.h"

@implementation UITextFieldPicker

@synthesize selectedText;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


//-- UIPickerViewDelegate, UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.text = [dataArray objectAtIndex:row];
    selectedText = self.text;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return [dataArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [dataArray objectAtIndex:row];
}

//-- ComboBox
-(void) setPickerData:(NSMutableArray*) data
{
    dataArray = data;
}


-(void)doneClicked:(id) sender
{
    [self resignFirstResponder]; //hides the pickerView
}


- (IBAction)showPicker:(id)sender {
    
    pickerView = [[UIPickerView alloc] init];
    pickerView.showsSelectionIndicator = YES;
    pickerView.dataSource = self;
    pickerView.delegate = self;
    
    UIToolbar* toolbar = [[UIToolbar alloc] init];
    toolbar.barStyle = UIBarStyleDefault;
    [toolbar sizeToFit];
    
    //to make the done button aligned to the right
    UIBarButtonItem *flexibleSpaceLeft = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStyleDone target:self
                                                                  action:@selector(doneClicked:)];
    
    [toolbar setItems:[NSArray arrayWithObjects:flexibleSpaceLeft, doneButton, nil]];
    
    //custom input view
    self.inputView = pickerView;
    self.inputAccessoryView = toolbar;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)aTextField
{
    [self showPicker:aTextField];
    return YES;
}

@end
