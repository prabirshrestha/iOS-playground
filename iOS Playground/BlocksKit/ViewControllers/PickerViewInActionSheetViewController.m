//
//  PickerViewInActionSheetViewController.m
//  iOS Playground
//
//  Created by Prabir Shrestha on 12/1/12.
//  Copyright (c) 2012 Prabir Shrestha. All rights reserved.
//

#import "PickerViewInActionSheetViewController.h"
#import <BlocksKit.h>

@interface PickerViewInActionSheetViewController ()

@end

@implementation PickerViewInActionSheetViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showPickerView:(id)sender {
    const CGFloat toolbarHeight = 44.f;
    const CGFloat pickerViewHeight = 455.f;
    const CGFloat actionSheetWidth = self.view.frame.size.width;

    __block NSArray *genders = @[@"Male", @"Female"];
    __block UIActionSheet *actionSheet = [[UIActionSheet alloc] init];
    UIToolbar *pickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, actionSheetWidth, toolbarHeight)];
    __block UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, toolbarHeight, actionSheetWidth, pickerViewHeight)];

    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered handler:^(id sender) {
        [actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    }];
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered handler:^(id sender) {
        id selectedItem = [genders objectAtIndex:[pickerView selectedRowInComponent:0]];
        NSLog(@"%@", selectedItem);
        [actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    }];

    [pickerToolbar setItems:@[cancelButton, flexSpace, doneButton] animated:YES];
    [actionSheet addSubview:pickerToolbar];

    pickerView.showsSelectionIndicator = YES;
    [pickerView.dynamicDataSource implementMethod:@selector(numberOfComponentsInPickerView:) withBlock:^(UIPickerView *pickerView){
        return 1;
    }];

    [pickerView.dynamicDataSource implementMethod:@selector(pickerView:numberOfRowsInComponent:) withBlock:^(UIPickerView *pickerView, NSInteger component){
        return (NSInteger)genders.count;
    }];

    [pickerView.dynamicDelegate implementMethod:@selector(pickerView:titleForRow:forComponent:) withBlock:^(UIPickerView *pickerView, NSInteger row, NSInteger component){
        return [genders objectAtIndex:row];
    }];

    [pickerView.dynamicDelegate implementMethod:@selector(pickerView:didSelectRow:inComponent:) withBlock:^(UIPickerView *pickerView, NSInteger row, NSInteger component){
//        NSLog(@"%@", [genders objectAtIndex:row]);
    }];

    pickerView.dataSource = pickerView.dynamicDataSource;
    pickerView.delegate = pickerView.dynamicDelegate;

    [actionSheet addSubview:pickerView];

    [actionSheet showInView:self.view];
    [actionSheet setBounds:CGRectMake(0, 0, actionSheetWidth, toolbarHeight + pickerViewHeight)];
}

@end
