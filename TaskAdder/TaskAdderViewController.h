//
//  TaskAdderViewController.h
//  ShowNextTask
//
//  Created by Nipun De Silva on 6/27/14.
//  Copyright (c) 2014 NotAOrganization. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskAdderViewController : UIViewController<UITextViewDelegate>{
    
    NSDate *date;
    NSDate *time;
}


@property (retain, nonatomic) IBOutlet UITextField *titleTxt;
@property (retain, nonatomic) IBOutlet UITextView *decriptionTxt;
@property (retain, nonatomic) IBOutlet UIView *datePickerView;
@property (retain, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (retain, nonatomic) IBOutlet UIButton *dateSelectorHideBtn;
@property (retain, nonatomic) IBOutlet UIButton *dateTimeSelectBtn;
@property (retain, nonatomic) IBOutlet UIButton *addTaskBtn;

- (IBAction)addTask:(id)sender;
- (IBAction)setTaskDate:(id)sender;
- (IBAction)showDateSelector:(id)sender;
- (IBAction)hideDateSelector:(id)sender;



@end
