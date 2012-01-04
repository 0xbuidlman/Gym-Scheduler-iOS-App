//
//  FirstViewController.h
//  blahhzers
//
//  Created by Kyle Murphy on 11/12/11.
//  Copyright (c) 2011 None.  Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScheduleViewController.h"

@interface FirstViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) NSArray *stuff;
@property (nonatomic, strong) NSString *schedule_id;
@property (nonatomic, strong) NSString *location_id;
@property (nonatomic, strong) NSString *schedule_name;


@end
