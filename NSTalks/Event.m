//
//  Event.m
//  NSTalks
//
//  Created by Natasha Murashev on 11/29/13.
//  Copyright (c) 2013 NatashaTheRobot. All rights reserved.
//

#import "Event.h"
#import <Parse/PFObject+Subclass.h>

@implementation Event

@dynamic title;
@dynamic date;

+ (NSString *)parseClassName
{
    return NSStringFromClass(Event.class);
}

@end
