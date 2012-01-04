//
//  LocationsViewController.h
//  dobby
//
//  Created by Kyle Murphy on 12/12/11.
//  Copyright (c) 2011 None.  Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"

@interface LocationsViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) NSArray *stuff;
@property (nonatomic, strong) NSString *location_id;
@end
