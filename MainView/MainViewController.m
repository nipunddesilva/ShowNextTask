//
//  MainViewController.m
//  ShowNextTask
//
//  Created by Nipun De Silva on 6/30/14.
//  Copyright (c) 2014 NotAOrganization. All rights reserved.
//

#import "MainViewController.h"
#import "TaskListHandler.h"
#import "Task.h"
#import "TaskAdderViewController.h"
#import "AddedTaskViewController.h"

@interface MainViewController ()

@property (nonatomic, retain) TaskAdderViewController *taVC;

@end

@implementation MainViewController

@synthesize taskListTable, taVC, viewOfTableView, addNewTaskBtn;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    taVC = [[TaskAdderViewController alloc] init];
    [self setTitle:@"Show Next Task"];

    viewOfTableView.clipsToBounds = YES;
    viewOfTableView.layer.cornerRadius = 10.0f;
    
    addNewTaskBtn.layer.cornerRadius = 10.0f;
    

    
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.taskListTable reloadData];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableViewControllingMethods -
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AddedTaskViewController *aTaskVC = [[AddedTaskViewController alloc] initWithSelectedTaskRow:indexPath.row];
    [self.navigationController pushViewController:aTaskVC animated:YES];
    [aTaskVC release];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 40.0f;

}


- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [[TaskListHandler sharedListHandler].taskList count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskCell"];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TaskCell"] autorelease];
    }
    
    Task *taskForCell = [[TaskListHandler sharedListHandler].taskList objectAtIndex:indexPath.row];
    
    cell.textLabel.text = taskForCell.title;
    return cell;

}

#pragma mark - UIElementsEvent -

- (IBAction)clickToSeeTaskAdder:(id)sender {
    
    [self.navigationController pushViewController:taVC animated:YES];
    
}
- (void)dealloc {
    [taskListTable release];
    [taVC release];
    [viewOfTableView release];
    [addNewTaskBtn release];
    [super dealloc];
    
}
@end









