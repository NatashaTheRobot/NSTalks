//
//  EventTableViewCell.m
//  NSTalks
//
//  Created by Natasha Murashev on 11/29/13.
//  Copyright (c) 2013 NatashaTheRobot. All rights reserved.
//

#import "EventTableViewCell.h"

@implementation EventTableViewCell

- (void)prepareForReuse
{
    self.textLabel.text = nil;
}

#pragma mark - Setter / Getter Overrides

- (void)setEvent:(Event *)event
{
    _event = event;
    self.textLabel.text = event.title;
}

@end
