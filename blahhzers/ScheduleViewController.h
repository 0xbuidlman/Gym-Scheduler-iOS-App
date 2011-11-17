//
//  ScheduleViewController.h
//  blahhzers
//
//  Created by Kyle Murphy on 11/13/11.
//  Copyright (c) 2011 None.  Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleViewController : UITableViewController
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) NSDictionary *stuff;
@property (nonatomic, strong) NSArray *days;
@property (nonatomic, strong) NSArray *currentClasses;
@property (nonatomic, strong) NSString *schedule_id;
@property (nonatomic, strong) NSString *day;
@property (nonatomic, strong) NSString *weekday;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *previousDay;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *nextDay;

@end
