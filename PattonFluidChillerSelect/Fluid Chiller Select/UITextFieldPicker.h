//
//  UITextFieldPicker.h
//  Fluid Chiller Select
//
//  Created by Kerry Powell on 2/04/14.
//  Copyright (c) 2014 Patton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextFieldPicker : UITextField<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
{
    UIPickerView* pickerView;
    NSMutableArray *dataArray;
}

-(void) setPickerData:(NSMutableArray*) data; //set the picker view items
@property (retain, nonatomic) NSString* selectedText; //the UITextField text

@end
