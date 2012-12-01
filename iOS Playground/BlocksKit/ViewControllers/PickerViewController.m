//
//  PickerViewController.m
//  iOS Playground
//
//  Created by Prabir Shrestha on 11/30/12.
//  Copyright (c) 2012 Prabir Shrestha. All rights reserved.
//

#import "PickerViewController.h"
#import <BlocksKit.h>

@interface PickerViewController ()

@property (strong, nonatomic) UIPickerView *pickerView;

@end

@implementation PickerViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    self.pickerView = nil;
}

- (IBAction)showPickerViewTouchUpInside:(id)sender {
    // Set pickerView's shown and hidden position frames.
    const CGFloat pickerDefaultHeight = 216.f;
    const CGFloat pickerDefaultWidth = 320.f;
    
    CGRect pickerViewShownFrame = CGRectMake(0.f, self.view.frame.size.height - pickerDefaultHeight, pickerDefaultWidth, pickerDefaultHeight);
    CGRect pickerViewHiddenFrame = CGRectMake(0.f, self.view.frame.size.height, pickerDefaultWidth, pickerDefaultHeight);
    
    // Set up the initial state of the picker.
    __block UIPickerView *pickerView = [[UIPickerView alloc] init];
    self.pickerView = pickerView;
    pickerView.frame = pickerViewHiddenFrame;
    pickerView.showsSelectionIndicator = YES;
    
    __block NSArray *genders = @[@"Male", @"Female"];
    
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
        NSLog(@"%@", [genders objectAtIndex:row]);
    }];
    
    pickerView.dataSource = pickerView.dynamicDataSource;
    pickerView.delegate = pickerView.dynamicDelegate;
    
//    [pickerView selectRow:1 inComponent:0 animated:NO];
    
    [self.view addSubview:self.pickerView];
    [UIView animateWithDuration:0.333 animations:^{
        pickerView.frame = pickerViewShownFrame;
    }];
}

@end
