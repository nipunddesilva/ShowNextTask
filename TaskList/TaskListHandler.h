//
//  TaskListHandler.h
//  ShowNextTask
//
//  Created by Nipun De Silva on 6/27/14.
//  Copyright (c) 2014 NotAOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskListHandler : NSObject <UIAlertViewDelegate>

@property (nonatomic, retain) NSMutableArray *taskList;

-(void) addTaskWithTitle: (NSString *)title Decription: (NSString *) description OnDate: (NSDate *) date;
-(NSUInteger) editTaskWithTitle: (NSString *)title Decription: (NSString *) description OnDate: (NSDate *) date AtIndex: (NSUInteger) index;
-(NSDictionary *) taskAtIndex: (NSUInteger) index;
+(TaskListHandler *) sharedListHandler;
-(void) deleteTaskAtIndex: (NSUInteger) index;

@end
