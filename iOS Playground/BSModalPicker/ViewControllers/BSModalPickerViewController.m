//
//  BSModalPickerViewController.m
//  iOS Playground
//
//  Created by Prabir Shrestha on 12/1/12.
//  Copyright (c) 2012 Prabir Shrestha. All rights reserved.
//

#import "BSModalPickerViewController.h"
#import <BSModalPickerView.h>

@interface BSModalPickerViewController ()

@end

@implementation BSModalPickerViewController

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
}

- (IBAction)showPickerTouchUpInside:(id)sender {
    __block NSArray *dataSource = @[@"Male", @"Female"];
    BSModalPickerView *pickerView = [[BSModalPickerView alloc] initWithValues:dataSource];
//    [pickerView presentInWindowWithBlock:^(BOOL madeChoice) {
    [pickerView presentInView:self.view withBlock:^(BOOL madeChoice) {
        if(!madeChoice) return;

        NSLog(@"Selected index: %d", pickerView.selectedIndex);
        NSLog(@"Selected value: %@", pickerView.selectedValue);
    }];
}

@end
