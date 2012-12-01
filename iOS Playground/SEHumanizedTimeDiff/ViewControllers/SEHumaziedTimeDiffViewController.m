//
//  SEHumaziedTimeDiffViewController.m
//  iOS Playground
//
//  Created by Prabir Shrestha on 12/1/12.
//  Copyright (c) 2012 Prabir Shrestha. All rights reserved.
//

#import "SEHumaziedTimeDiffViewController.h"
#import <NSDate+HumanizedTime.h>

@interface SEHumaziedTimeDiffViewController ()

@property (weak, nonatomic) IBOutlet UILabel *timeNowLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondsLabel;
@property (weak, nonatomic) IBOutlet UILabel *aMinuteLabel;
@property (weak, nonatomic) IBOutlet UILabel *minutesLabel;
@property (weak, nonatomic) IBOutlet UILabel *anHourLabel;
@property (weak, nonatomic) IBOutlet UILabel *hoursLabel;
@property (weak, nonatomic) IBOutlet UILabel *aDayLabel;
@property (weak, nonatomic) IBOutlet UILabel *daysLabel;
@property (weak, nonatomic) IBOutlet UILabel *aYearLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearsLabel;

@end

@implementation SEHumaziedTimeDiffViewController

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

    NSDate *now= [NSDate date];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    self.timeNowLabel.text = [dateFormatter stringFromDate:now];

    [self setupHumanizedTimeDiff];
}

- (void)setupHumanizedTimeDiff {
    self.secondsLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-10] stringWithHumanizedTimeDifference];
    self.aMinuteLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-60] stringWithHumanizedTimeDifference];
    self.minutesLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-360] stringWithHumanizedTimeDifference];
    self.anHourLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-3600] stringWithHumanizedTimeDifference];
    self.hoursLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-10800] stringWithHumanizedTimeDifference];
    self.aDayLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-3600*24] stringWithHumanizedTimeDifference];
    self.daysLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-3600*24*5] stringWithHumanizedTimeDifference];
    self.aYearLabel.text =  [[NSDate dateWithTimeIntervalSinceNow:-3600*24*365] stringWithHumanizedTimeDifference];
    self.yearsLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-3600*24*1000] stringWithHumanizedTimeDifference];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
