//
//  MainViewController.h
//  ShowNextTask
//
//  Created by Nipun De Silva on 6/30/14.
//  Copyright (c) 2014 NotAOrganization. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (retain, nonatomic) IBOutlet UITableView *taskListTable;
@property (retain, nonatomic) IBOutlet UIView *viewOfTableView;
@property (retain, nonatomic) IBOutlet UIButton *addNewTaskBtn;

- (IBAction)clickToSeeTaskAdder:(id)sender;


@end
