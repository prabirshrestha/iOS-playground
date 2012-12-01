//
//  ActionSheetViewController.m
//  iOS Playground
//
//  Created by Prabir Shrestha on 11/30/12.
//  Copyright (c) 2012 Prabir Shrestha. All rights reserved.
//

#import "ActionSheetViewController.h"
#import <BlocksKit.h>

@interface ActionSheetViewController ()

@end

@implementation ActionSheetViewController

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

- (IBAction)showActionSheetTouchUpInside:(id)sender {
    UIActionSheet *actionSheet = [UIActionSheet actionSheetWithTitle:@"Sample Action Sheet"];
    [actionSheet addButtonWithTitle:@"OK" handler:^{
        NSLog(@"OK");
    }];
    [actionSheet setCancelButtonWithTitle:@"Cancel" handler:nil];
    [actionSheet showInView:self.view];
}

- (IBAction)showActionSheetWithoutTitleTouchUpInside:(id)sender {
    UIActionSheet *actionSheet = [UIActionSheet actionSheetWithTitle:nil];
    [actionSheet addButtonWithTitle:@"OK" handler:^{
        NSLog(@"OK");
    }];
    [actionSheet setCancelButtonWithTitle:@"Cancel" handler:nil];
    [actionSheet showInView:self.view];
}

- (IBAction)showActionSheetAndHideOnTapTouchUpInside:(id)sender {
    __block UIActionSheet *actionSheet = [UIActionSheet actionSheetWithTitle:nil];
    [actionSheet addButtonWithTitle:@"OK" handler:^{
        NSLog(@"OK");
    }];
    [actionSheet setCancelButtonWithTitle:@"Cancel" handler:nil];
    [actionSheet showInView:self.view];

    [actionSheet.superview whenTapped:^{
        [actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    }];
}

@end
