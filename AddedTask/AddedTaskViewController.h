//
//  AddedTaskViewController.h
//  ShowNextTask
//
//  Created by Nipun De Silva on 7/1/14.
//  Copyright (c) 2014 NotAOrganization. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskEditorViewController.h"


@interface AddedTaskViewController : UIViewController <IndexTrackerDelegate>

-(id) initWithSelectedTaskRow: (NSUInteger) row;
- (IBAction)editThisTask:(id)sender;
- (IBAction)deleteThisTask:(id)sender;

@end
