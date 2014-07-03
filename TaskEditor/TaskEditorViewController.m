//
//  TaskEditorViewController.m
//  ShowNextTask
//
//  Created by Nipun De Silva on 7/2/14.
//  Copyright (c) 2014 NotAOrganization. All rights reserved.
//

#import "TaskEditorViewController.h"
#import "TaskListHandler.h"
#import "Task.h"

@interface TaskEditorViewController ()



@end

@implementation TaskEditorViewController

@synthesize taskIndex, itDelegate;

- (id) initWithTaskIndex: (NSUInteger) index{
    self = [super initWithNibName:@"TaskAdderViewController" bundle:nil];
    if (self) {
        taskIndex = index;
    }
    return self;
}

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
    // Do any additional setup after loading the view.
    [self setTitle:@"Task Editor"];
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    

    NSDictionary *task = [[[TaskListHandler sharedListHandler] taskAtIndex:taskIndex] retain];

    self.titleTxt.text = [task objectForKey:@"TTitle"];
    self.decriptionTxt.text = [task objectForKey:@"TDesc"];

    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"MM/dd/yyyy - hh:mm:ss"];
    date = [task objectForKey:@"TDate"];
    
    [self.dateTimeSelectBtn setTitle:[df stringFromDate:date] forState:UIControlStateNormal];
    [self.addTaskBtn setTitle:@"Done" forState:UIControlStateNormal];
    
    
    [df release];
    [task release];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

#pragma mark - UIElementsEvent -
- (IBAction)addTask:(id)sender {
    
    TaskListHandler *tlHandler = [TaskListHandler sharedListHandler];
    self.taskIndex = [tlHandler editTaskWithTitle:self.titleTxt.text Decription:self.decriptionTxt.text OnDate:date AtIndex:self.taskIndex];
    [itDelegate takeNewIndex:self.taskIndex];
    [self.navigationController popViewControllerAnimated:YES];

    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
