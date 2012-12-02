//
//  MainViewController.m
//  iOS Playground
//
//  Created by Prabir Shrestha on 11/30/12.
//  Copyright (c) 2012 Prabir Shrestha. All rights reserved.
//

#import "MainViewController.h"
#import <MTBlockTableView.h>

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet MTBlockTableView *tableView;

@end

@implementation MainViewController

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
    [self setupTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setupTableView {
    NSArray *datasource = @[
              @"BlocksKit"
            , @"BSKeyboardControls"
            , @"BSModalPicker"
            , @"SEHumanizedTimeDiff"
            , @"Youtube"
    ];
    
    [self.tableView setNumberOfRowsInSectionBlock:^NSInteger(UITableView *tableView, NSInteger section) {
        return datasource.count;
    }];
    
    [self.tableView setCellForRowAtIndexPathBlock:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        
        cell.textLabel.text = [datasource objectAtIndex:indexPath.row];
        
        return cell;
    }];
    
    [self.tableView setDidSelectRowAtIndexPathBlock:^(UITableView *tableView, NSIndexPath *indexPath) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:[NSString stringWithFormat:@"%@Storyboard", datasource[indexPath.row]] bundle:nil];
        UIViewController* vc = [storyboard instantiateInitialViewController];
        [self.navigationController pushViewController:vc animated:YES];
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }];
}

@end
