//
//  TaskListHandler.m
//  ShowNextTask
//
//  Created by Nipun De Silva on 6/27/14.
//  Copyright (c) 2014 NotAOrganization. All rights reserved.
//

#import "TaskListHandler.h"
#import "Task.h"

@implementation TaskListHandler

@synthesize taskList;

static TaskListHandler *sharedTaskListHandler = nil;

#pragma mark - PrivateMethod -
- (void) dealloc{
    [taskList release];
    [super dealloc];
}

-(void) initilizedTLH{
    taskList = [[NSMutableArray alloc] init];
}

- (NSUInteger) positionForTaskListInTaskList: (NSDate *) date{
    if ([taskList count] == 0) {
    
        return NSNotFound;
        
    }else{
        for (Task *task in taskList) {
            BOOL con1 = [date compare:task.date] == NSOrderedAscending;
            BOOL con2 = [date compare:task.date] == NSOrderedSame;
            
            if (con1 || con2) {
                return [taskList indexOfObject:task];
            }
        }
        return NSNotFound;
    
    }
}

#pragma mark - PublicMethods -

+(TaskListHandler *) sharedListHandler{
    @synchronized(self){
        if (sharedTaskListHandler == nil) {
            sharedTaskListHandler = [[self alloc] init];
            [sharedTaskListHandler initilizedTLH];
        }
    }
    
    return sharedTaskListHandler;
}

-(void) addTaskWithTitle: (NSString *)title Decription: (NSString *) description OnDate: (NSDate *) date{
    @autoreleasepool {
        NSDate *now = [[[NSDate alloc] init] autorelease];
        if ([now compare:date] == NSOrderedDescending) {
            [self showAlertWithMessage:@"Date has passed"];
            return;
        }
    }
    
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"MM/dd/yyyy - hh:mm:ss"];
    
    Task *task = [[Task alloc] init];
    
    task.title = title;
    task.taskDescription = description;
    task.date = date;

    
    NSUInteger indexForTask = [self positionForTaskListInTaskList:date];
    if (indexForTask == NSNotFound) {
        [taskList addObject:task];
    }else{
        [taskList insertObject:task atIndex:indexForTask];
    }
    
    [task release];
    [df release];

    
}

-(NSUInteger) editTaskWithTitle: (NSString *)title Decription: (NSString *) description OnDate: (NSDate *) date AtIndex: (NSUInteger) index
{

    @autoreleasepool {
        NSDate *now = [[[NSDate alloc] init] autorelease];
        if ([now compare:date] == NSOrderedDescending) {
            [self showAlertWithMessage:@"Date has passed"];
            return index;
        }
    }
    
    Task *task = [[Task alloc] init];
    
    task.title = title;
    task.taskDescription = description;
    task.date = date;
    
    [taskList removeObjectAtIndex:index];
    NSUInteger newIndex = [self positionForTaskListInTaskList:date];

    if (newIndex == NSNotFound) {
        [taskList addObject:task];
        newIndex = [taskList indexOfObject:task];
    }else{
        [taskList insertObject:task atIndex:newIndex];
    }
    
    [task release];
    return newIndex;
}

-(NSDictionary *) taskAtIndex: (NSUInteger) index{
    Task *t = [taskList objectAtIndex:index];
    NSDictionary *taskAsDict = [[[NSDictionary alloc] initWithObjectsAndKeys:t.title, @"TTitle", t.taskDescription, @"TDesc", t.date, @"TDate",nil] autorelease];
    return taskAsDict;
}

-(void) deleteTaskAtIndex: (NSUInteger) index{
    [taskList removeObjectAtIndex:index];
}

-(void) showAlertWithMessage:(NSString *) message{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Invalid Date" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil,nil];
    [alertView show];
    [alertView release];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        NSLog(@"Ok Button Cliked");
    }
}
@end
