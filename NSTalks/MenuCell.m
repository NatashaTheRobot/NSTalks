//
//  MenuCell.m
//  NSTalks
//
//  Created by Natasha Murashev on 11/29/13.
//  Copyright (c) 2013 NatashaTheRobot. All rights reserved.
//

#import "MenuCell.h"

@implementation MenuCell

- (void)configureCellWithText:(NSString *)text
{
    self.textLabel.text = text;
    self.textLabel.textColor = [UIColor whiteColor];
    
    UIView *selectedBackgroundView = [UIView new];
    selectedBackgroundView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.25];
    self.selectedBackgroundView = selectedBackgroundView;
}

@end
