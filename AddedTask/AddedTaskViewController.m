//
//  AddedTaskViewController.m
//  ShowNextTask
//
//  Created by Nipun De Silva on 7/1/14.
//  Copyright (c) 2014 NotAOrganization. All rights reserved.
//


#import "AddedTaskViewController.h"
#import "TaskListHandler.h"
#import "Task.h"

@interface AddedTaskViewController ()

@property (assign, nonatomic) NSUInteger taskIndex;
@property (retain, nonatomic) IBOutlet UITextField *taskTitle;
@property (retain, nonatomic) IBOutlet UITextView *taskDescription;
@property (retain, nonatomic) IBOutlet UILabel *taskDateAndTime;
@property (retain, nonatomic) TaskEditorViewController *teditVC;

@end

@implementation AddedTaskViewController

@synthesize taskIndex, taskTitle, taskDescription, taskDateAndTime, teditVC;

-(id) initWithSelectedTaskRow: (NSUInteger) row
{
    
    self = [super initWithNibName:@"AddedTaskViewController" bundle:nil];
    if (self) {
        taskIndex = row;
    }
    return self;
}

- (IBAction)editThisTask:(id)sender {
    self.teditVC.taskIndex = self.taskIndex;
    [self.navigationController pushViewController:self.teditVC animated:YES];
}

- (IBAction)deleteThisTask:(id)sender {
    [[TaskListHandler sharedListHandler] deleteTaskAtIndex:taskIndex];
    [self.navigationController popViewControllerAnimated:YES];
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
    // Do any additional setup after loading the view from its nib.
    [self setTitle:@"View Task"];
    
    self.teditVC = [[TaskEditorViewController alloc] initWithNibName:@"TaskAdderViewController" bundle:nil];
    self.teditVC.itDelegate = self;
    
    TaskListHandler *tLHandler = [TaskListHandler sharedListHandler];
    Task *theTask = [tLHandler.taskList objectAtIndex:self.taskIndex];
    self.taskTitle.text = theTask.title;
    self.taskDescription.text = theTask.taskDescription;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy - hh:mm:ss"];
    self.taskDateAndTime.text = [dateFormatter stringFromDate:theTask.date];
    [dateFormatter release];
    
    [self uiElementsInteractionsEnable:NO];
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    NSDictionary *task = [[[TaskListHandler sharedListHandler] taskAtIndex:taskIndex] retain];
    self.taskTitle.text = [task objectForKey:@"TTitle"];
    self.taskDescription.text = [task objectForKey:@"TDesc"];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"MM/dd/yyyy - hh:mm:ss"];
    
    self.taskDateAndTime.text = [df stringFromDate:[task objectForKey:@"TDate"]];
    
    [task release];
    [df release];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [taskTitle release];
    [taskDescription release];
    [taskDateAndTime release];
    [teditVC release];
    [super dealloc];
}

#pragma mark -HelperMethods-
-(void) uiElementsInteractionsEnable: (BOOL) enable{
    self.taskTitle.userInteractionEnabled = enable;
    self.taskDescription.userInteractionEnabled = enable;
    self.taskDateAndTime.userInteractionEnabled = enable;
}

- (void) takeNewIndex: (NSUInteger) index{

    self.taskIndex = index;

}

@end
