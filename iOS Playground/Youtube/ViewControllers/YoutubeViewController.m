//
//  YoutubeViewController.m
//  iOS Playground
//
//  Created by Prabir Shrestha on 12/1/12.
//  Copyright (c) 2012 Prabir Shrestha. All rights reserved.
//

#import "YoutubeViewController.h"

@interface YoutubeViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation YoutubeViewController

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
    [self loadYoutubeVideo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setWebView:nil];
    [super viewDidUnload];
}

- (void)loadYoutubeVideo {
    NSString *newHTML = [NSString stringWithFormat:@"<html>\
                         <style>body{padding:0;margin:0;}</style>\
                         <iframe width=\"%f\" height=\"%f\" src=\"http://www.youtube.com/embed/zL0CCsdS1cE\" frameborder=\"0\" allowfullscreen></iframe>\
                         </html>",
                         self.view.frame.size.width,
                         self.view.frame.size.height];
    
    [self.webView loadHTMLString:newHTML baseURL:nil];
}

@end
