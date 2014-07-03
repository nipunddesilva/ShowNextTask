//
//  Task.h
//  ShowNextTask
//
//  Created by Nipun De Silva on 6/27/14.
//  Copyright (c) 2014 NotAOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *taskDescription;
@property (nonatomic, retain) NSDate *date;

@end
