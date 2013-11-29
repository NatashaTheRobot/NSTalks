//
//  Event.h
//  NSTalks
//
//  Created by Natasha Murashev on 11/29/13.
//  Copyright (c) 2013 NatashaTheRobot. All rights reserved.
//

@interface Event : PFObject <PFSubclassing>

+ (NSString *)parseClassName;

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSDate *date;

@end
