//
//  TaskEditorViewController.h
//  ShowNextTask
//
//  Created by Nipun De Silva on 7/2/14.
//  Copyright (c) 2014 NotAOrganization. All rights reserved.
//

#import "TaskAdderViewController.h"

@protocol IndexTrackerDelegate

- (void) takeNewIndex: (NSUInteger) index;

@end

@interface TaskEditorViewController : TaskAdderViewController
{
    
    id <IndexTrackerDelegate> itDelegate;
    
}
@property (nonatomic, assign) id <IndexTrackerDelegate> itDelegate;
@property (nonatomic,assign) NSUInteger taskIndex;
- (id) initWithTaskIndex: (NSUInteger) index;

@end
