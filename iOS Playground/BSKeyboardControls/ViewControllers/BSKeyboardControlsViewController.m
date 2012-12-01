//
//  BSKeyboardControlsViewController.m
//  iOS Playground
//
//  Created by Prabir Shrestha on 12/1/12.
//  Copyright (c) 2012 Prabir Shrestha. All rights reserved.
//

#import "BSKeyboardControlsViewController.h"
#import <BlocksKit.h>


@interface BSKeyboardControlsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *middleNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;

@end

@implementation BSKeyboardControlsViewController

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
    [self.view whenTapped:^{
        [self.view endEditing:YES];
    }];
    [self setupBSKeyboardControls];
}

- (void)setupBSKeyboardControls {
    __block BSKeyboardControls *keyboardControls = [[BSKeyboardControls alloc] init];

    [keyboardControls.dynamicDelegate implementMethod:@selector(keyboardControlsDonePressed:) withBlock:^(BSKeyboardControls *keyboardControls) {
        [keyboardControls.activeTextField resignFirstResponder];
    }];
    [keyboardControls.dynamicDelegate implementMethod:@selector(keyboardControlsPreviousNextPressed:withDirection:andActiveTextField:)
                                            withBlock:^(BSKeyboardControls *keyboardControls, KeyboardControlsDirection direction, id textField) {
        [textField becomeFirstResponder];
        // scroll to text field
    }];
    keyboardControls.delegate = keyboardControls.dynamicDelegate;

//    keyboardControls.delegate = self;

    // Add all text fields you want to be able to skip between to the keyboard controls
    // The order of this text fields are important. The order is used when pressing "Previous" or "Next"
    keyboardControls.textFields = @[
            self.firstNameTextField,
            self.middleNameTextField,
            self.lastNameTextField,
    ];

    // Add the keyboard control as accessory view for all of the text fields
    // Also set the delegate of all the text fields to self
//    [keyboardControls reloadTextFields];
    [keyboardControls.textFields enumerateObjectsUsingBlock:^(UITextField *textField, NSUInteger idx, BOOL *stop) {
        textField.inputAccessoryView = keyboardControls;

        [textField.dynamicDelegate implementMethod:@selector(textFieldDidBeginEditing:) withBlock:^(UITextField *textField){
            if ([keyboardControls.textFields containsObject:textField]) {
                keyboardControls.activeTextField = textField;
            }
        }];

        textField.delegate = textField.dynamicDelegate;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [self setFirstNameTextField:nil];
    [self setMiddleNameTextField:nil];
    [self setLastNameTextField:nil];
    [super viewDidUnload];
}


@end
