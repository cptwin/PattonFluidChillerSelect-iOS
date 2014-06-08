//
//  FluidType.m
//  Fluid Chiller Select
//
//  Created by Kerry Powell on 7/04/14.
//  Copyright (c) 2014 Patton. All rights reserved.
//

#import "FluidType.h"

@implementation FluidType

-(id)init
{
    self = [super init];
    if (self) {
        
        fluidNames = [[NSArray alloc] initWithObjects:@"Water", @"Propylene Glycol 10%", @"Propylene Glycol 20%", @"Propylene Glycol 30%", @"Propylene Glycol 40%", @"Ethylene Glycol 10%", @"Ethylene Glycol 20%", @"Ethylene Glycol 30%", @"Ethylene Glycol 40%", @"Unknown Type", nil];
    
        double vTmp[] = {4.185 ,4.102, 4.018, 3.913, 3.746, 4.001, 3.911, 3.821, 3.599, 0.0};
        for (int i = 0; i < 10; i++)
        {
            v[i] = vTmp[i];
        }
        int lowTmp[] = {2, -2, -6, -12, -20, -2, -7, -13, -23, 0};
        for (int i = 0; i < 10; i++)
        {
            lowestTemp[i] = lowTmp[i];
        }
        selectedIndex = 0;
        NSLog(@"%@", fluidNames[0]);

    }
    NSLog(@"%@", @"test");
    return self;
}

-(NSArray *)getNameArray
{
    NSArray *result = [[NSArray alloc] initWithArray:fluidNames];
    return result;
}

-(bool)setType:(NSString *)name
{
    NSUInteger i = [fluidNames indexOfObject:name];
    if (i != NSNotFound)
    {
        selectedIndex = i;
    }
    return false;
}

-(NSString *)getName
{
    return (NSString *)[fluidNames objectAtIndex:selectedIndex];
}

-(double)getValue
{
    return v[selectedIndex];
}

-(int)getLowestAllowedTemp
{
    return lowestTemp[selectedIndex];
}

-(void)reset
{
    selectedIndex = 0;
}

@end
