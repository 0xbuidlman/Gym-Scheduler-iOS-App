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
<<<<<<< HEAD
@property (nonatomic, strong) NSArray *stuff;
@property (nonatomic, strong) NSArray *days;
@property (nonatomic, strong) NSArray *currentClasses;
@property (nonatomic, strong) NSString *schedule_id;
@property (nonatomic, strong) NSString *workout_id;
=======
@property (nonatomic, strong) NSDictionary *stuff;
@property (nonatomic, strong) NSArray *days;
@property (nonatomic, strong) NSArray *currentClasses;
@property (nonatomic, strong) NSString *schedule_id;
>>>>>>> bfe6fd512b0e839a62d97f6e03c1d6164959b704
@property (nonatomic, strong) NSString *day;
@property (nonatomic, strong) NSString *weekday;
@property (nonatomic, strong) NSDate *nextDay;
@property (nonatomic, strong) NSDate *previousDay;
@property (nonatomic, strong) NSDate *initialDay;
<<<<<<< HEAD
@property (nonatomic, strong) NSArray *daysOfWeek;
=======
>>>>>>> bfe6fd512b0e839a62d97f6e03c1d6164959b704

@property (weak, nonatomic) IBOutlet UIBarButtonItem *previousDayItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextDayItem;

-(IBAction)nextDay:(id)sender;
-(IBAction)previousDay:(id)sender;

@end
