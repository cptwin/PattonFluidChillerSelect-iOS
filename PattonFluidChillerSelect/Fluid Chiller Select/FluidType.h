//
//  FluidType.h
//  Fluid Chiller Select
//
//  Created by Kerry Powell on 7/04/14.
//  Copyright (c) 2014 Patton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FluidType : NSObject
{
    NSArray *fluidNames;
    double v[10];
    int lowestTemp[10];
    int selectedIndex;
}

-(NSArray *)getNameArray;
-(void)reset;
-(bool)setType:(NSString *)name;
-(NSString *)getName;
-(double)getValue;
-(int)getLowestAllowedTemp;

@end
