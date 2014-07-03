//
//  TaskAdderViewController.m
//  ShowNextTask
//
//  Created by Nipun De Silva on 6/27/14.
//  Copyright (c) 2014 NotAOrganization. All rights reserved.
//

#import "TaskAdderViewController.h"
#import "TaskListHandler.h"

@interface TaskAdderViewController ()
@end

@implementation TaskAdderViewController

@synthesize titleTxt,decriptionTxt, datePickerView, datePicker, dateSelectorHideBtn, dateTimeSelectBtn, addTaskBtn;

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
    [self setTitle:@"Add New Task"];
    
    decriptionTxt.delegate = self;
    
    //Make Border corners round
    decriptionTxt.clipsToBounds = YES;
    decriptionTxt.layer.cornerRadius = 10.0f;
    
    addTaskBtn.clipsToBounds = YES;
    addTaskBtn.layer.cornerRadius = 10.0f;
    
    dateTimeSelectBtn.clipsToBounds = YES;
    dateTimeSelectBtn.layer.cornerRadius = 10.0f;
    
    datePickerView.frame = CGRectMake(320, 50, datePickerView.frame.size.width, datePickerView.frame.size.height);
    [self.view addSubview:datePickerView];
    
    self.titleTxt.text = @"";
    self.decriptionTxt.text = @"";
    [self.dateTimeSelectBtn setTitle:@"Date, Time" forState:UIControlStateNormal];
    


}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.titleTxt.text = @"";
    self.decriptionTxt.text = @"";
    [self.dateTimeSelectBtn setTitle:@"Date, Time" forState:UIControlStateNormal];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [decriptionTxt release];
    [titleTxt release];
    [datePickerView release];
    [datePicker release];
    [dateSelectorHideBtn release];
    [dateTimeSelectBtn release];
    [addTaskBtn release];
    [super dealloc];
}


#pragma mark - PrivateMethods -
- (void) uiInteractionsEnable: (BOOL) enable{

    titleTxt.userInteractionEnabled = enable;
    decriptionTxt.userInteractionEnabled = enable;
    dateTimeSelectBtn.userInteractionEnabled = enable;
    addTaskBtn.userInteractionEnabled = enable;

}

#pragma mark - UIEvents -


- (IBAction)addTask:(id)sender {
    
    TaskListHandler *tlHandler = [TaskListHandler sharedListHandler];
    [tlHandler addTaskWithTitle:titleTxt.text Decription:decriptionTxt.text OnDate:date];
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
}

- (IBAction)setTaskDate:(id)sender {
    NSDate *date1 = [datePicker date];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"MM/dd/yyyy - hh:mm:ss"];
    [dateSelectorHideBtn setTitle:[df stringFromDate:date1] forState:UIControlStateNormal];
    [df release];
    

}



- (IBAction)showDateSelector:(id)sender {
    datePickerView.frame = CGRectMake(0, 50, datePickerView.frame.size.width, datePickerView.frame.size.height);
    [self uiInteractionsEnable:NO];
    
}

- (IBAction)hideDateSelector:(id)sender {
    datePickerView.frame = CGRectMake(320, 50, datePickerView.frame.size.width, datePickerView.frame.size.height);
    
    date = [datePicker date];
    [date retain];
    
    [self uiInteractionsEnable:YES];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"MM/dd/yyyy - hh:mm:ss"];
    [dateTimeSelectBtn setTitle:[df stringFromDate:date] forState:UIControlStateNormal];
    [df release];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

@end
