//
//  TodayViewController.m
//  GeoTappyToday
//
//  Created by Dylan Marriott on 11/10/14.
//  Copyright (c) 2014 Dylan Marriott. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "ProfileView.h"
#import "HorizontalScroller.h"

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredContentSize = CGSizeMake(200, 200);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UILabel* description = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    description.text = @"hello";
    description.font = [UIFont systemFontOfSize:13];
    description.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    [self.view addSubview:description];
    
    UIImage* demoImage = [UIImage imageNamed:@"demo-profile"];
    ProfileView* profileView1 = [[ProfileView alloc] initWithFrame:CGRectMake(0, 0, 44, 44) images:@[demoImage]];
    ProfileView* profileView2 = [[ProfileView alloc] initWithFrame:CGRectMake(0, 0, 44, 44) images:@[demoImage]];
    
    HorizontalScroller* scroller = [[HorizontalScroller alloc] initWithViews:@[profileView1, profileView2]];
    scroller.view.frame = CGRectMake(0, 30, 200, 44);
    scroller.padding = UIOffsetMake(10, 0);
    [self addChildViewController:scroller];
    [self.view addSubview:scroller.view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}



@end