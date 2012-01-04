//
//  ScheduleCell.h
//  dobby
//
//  Created by Kyle Murphy on 12/11/11.
//  Copyright (c) 2011 None.  Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScheduleCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *title;
@property (nonatomic, strong) IBOutlet UILabel *instructor;
@property (nonatomic, strong) IBOutlet UILabel *hours;

@end
