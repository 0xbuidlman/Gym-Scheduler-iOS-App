//
//  ScheduleViewController.m
//  blahhzers
//
//  Created by Kyle Murphy on 11/13/11.
//  Copyright (c) 2011 None.  Student. All rights reserved.
//

#import "ScheduleViewController.h"


@implementation ScheduleViewController
<<<<<<< HEAD
@synthesize data, stuff, days, currentClasses, schedule_id, workout_id, weekday, day, previousDay, nextDay, nextDayItem, previousDayItem, initialDay, daysOfWeek;
=======
@synthesize data, stuff, days, currentClasses, schedule_id, weekday, day, previousDay, nextDay, nextDayItem, previousDayItem, initialDay;
>>>>>>> bfe6fd512b0e839a62d97f6e03c1d6164959b704

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void) myData {
	if (!data) {
        // Log this event
        NSLog(@"Fetching schedule JSON dataasdfasdf");
        
        // Prepare URL request to download statuses from Twitter
        NSString *scheduleUrl = [NSString stringWithFormat:@"http://dobby-rails-app.dev/schedules/%@/workouts.json", self.schedule_id];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:scheduleUrl]];
        
        // Perform request and get JSON back as a NSData object
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        NSError* error;
<<<<<<< HEAD
        NSArray * jsonArr = [NSJSONSerialization 
=======
        NSDictionary * jsonArr = [NSJSONSerialization 
>>>>>>> bfe6fd512b0e839a62d97f6e03c1d6164959b704
                             JSONObjectWithData:response //1                              
                             options:kNilOptions
                             error:&error];
        
        self.stuff = jsonArr;
<<<<<<< HEAD
=======
        NSLog(@"sched jsonArr: %@", jsonArr);        
>>>>>>> bfe6fd512b0e839a62d97f6e03c1d6164959b704
	}
}

- (NSString *) formattedDate:(NSDate *)theDate offsetby:(NSInteger)offSet {
    // start by retrieving day, weekday, month and year components for yourDate
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    // now build a NSDate object for the next day
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:offSet];
    NSDate *nextDate = [gregorian dateByAddingComponents:offsetComponents toDate: theDate options:0];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];  
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *thisWeekday = [dateFormatter stringFromDate:nextDate];
    
    [dateFormatter setDateFormat:@"MM/dd"];
    NSString *thisDay = [dateFormatter stringFromDate:nextDate];
    
    if (offSet == 1)
        self.nextDay = nextDate;
    else if (offSet == -1)
        self.previousDay = nextDate;
<<<<<<< HEAD
        
=======
    
    NSLog(@"dealy: %@", [NSString stringWithFormat:@"%@ %@", thisWeekday, thisDay]);
    
>>>>>>> bfe6fd512b0e839a62d97f6e03c1d6164959b704
    return [NSString stringWithFormat:@"%@ %@", thisWeekday, thisDay];
}
#pragma mark - View lifecycle
- (void) loadData {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; 
    
    if (!self.initialDay) {
        self.initialDay = [NSDate date];
    }
<<<<<<< HEAD
    
    self.daysOfWeek = [[NSArray alloc] initWithObjects:@"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", nil];
=======

>>>>>>> bfe6fd512b0e839a62d97f6e03c1d6164959b704
    [dateFormatter setDateFormat:@"EEEE"];
    self.weekday = [dateFormatter stringFromDate:self.initialDay];
    
    [dateFormatter setDateFormat:@"MM/dd"];
    self.day = [dateFormatter stringFromDate:self.initialDay];
    self.nextDayItem.title = [self formattedDate:self.initialDay offsetby:1];
<<<<<<< HEAD
    self.previousDayItem.title = [self formattedDate:self.initialDay offsetby:-1];
    
    NSMutableArray *classes = [[NSMutableArray alloc] init];
    for (NSDictionary *element in self.stuff) {
        NSString *thisDay = [element objectForKey:@"day"];
        NSLog(@"thisDay: %@, weekday: %@", thisDay, self.weekday);
        if ([thisDay isEqualToString:self.weekday]) {
            [classes addObject:element];
            NSLog(@"element: %@", element);
        }
        
    }
    self.currentClasses = classes;
}

=======
    NSLog(@"blahzdf: %@", self.nextDayItem.title);
    self.previousDayItem.title = [self formattedDate:self.initialDay offsetby:-1];
    
    NSArray *classes = [self.stuff objectForKey:weekday];
    
    self.currentClasses = classes;
}
>>>>>>> bfe6fd512b0e839a62d97f6e03c1d6164959b704
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self myData];
    [self loadData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section {
	return [NSString stringWithFormat:@"%@ %@", self.weekday, self.day];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.currentClasses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
<<<<<<< HEAD
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; 

    NSUInteger row = [indexPath row];

=======
    NSUInteger row = [indexPath row];
        
>>>>>>> bfe6fd512b0e839a62d97f6e03c1d6164959b704
    UITableViewCell *cell = [tableView 
                             dequeueReusableCellWithIdentifier:@"ScheduleCell"];
    
    NSLog(@"current classes: %@", self.currentClasses);
    
    NSDictionary *workout = [self.currentClasses objectAtIndex:row];
<<<<<<< HEAD
    self.workout_id = [workout objectForKey:@"id"];

    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    NSString *start_time = [[workout objectForKey:@"start_time"] substringToIndex:[[workout objectForKey:@"start_time"] length] - 1];
    NSDate *start_time_date = [dateFormatter dateFromString:start_time];
    NSString *length = [[workout objectForKey:@"length"] substringToIndex:[[workout objectForKey:@"length"] length] - 1];
    NSDate *length_date = [dateFormatter dateFromString:length];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:( kCFCalendarUnitHour | kCFCalendarUnitMinute) fromDate:length_date];
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];
    NSTimeInterval seconds = (hour * 3600) + (minute * 60);
    NSDate *end_time_date = [start_time_date dateByAddingTimeInterval:seconds];
    
    [dateFormatter setDateFormat:@"h:mm aaa"];
    NSString *start_time_ampm = [dateFormatter stringFromDate:start_time_date];
    [dateFormatter setDateFormat:@"h:mm aaa"];
    NSString *end_time_ampm = [dateFormatter stringFromDate:end_time_date];
    NSString *friendly_hours = [NSString stringWithFormat:@"%@\n%@", start_time_ampm, end_time_ampm];
 
    NSLog(@"date: %d, %d", hour, minute);
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:100];
    titleLabel.text = [workout objectForKey: @"name"];

    UILabel *hoursLabel = (UILabel *)[cell viewWithTag:102];
    hoursLabel.text = friendly_hours;
    
    UILabel *instructorLabel = (UILabel *)[cell viewWithTag:101];
    NSString *instructor = [workout objectForKey:@"instructor"];
    instructorLabel.text = [NSString stringWithFormat:@"Instructor: %@", instructor];
        
=======
        
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    NSString *start_time = [[workout objectForKey:@"start_time"] substringToIndex:[[workout objectForKey:@"start_time"] length] - 1];
    NSDate *date = [dateFormatter dateFromString:start_time];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(kCFCalendarUnitHour | kCFCalendarUnitMinute) fromDate:date];
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];

    NSLog(@"date: %d, %d", hour, minute);
    cell.textLabel.text = [workout objectForKey: @"name"];
    UILabel *hoursLabel = (UILabel *)[cell viewWithTag:101];
    hoursLabel.text = [workout objectForKey: @"friendly_time"];
    
>>>>>>> bfe6fd512b0e839a62d97f6e03c1d6164959b704
    // Configure the cell.
    return cell;
}

<<<<<<< HEAD
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    NSDictionary *workout = [self.currentClasses objectAtIndex:row];
    NSString *info = [NSString stringWithFormat:@"%@", [workout objectForKey: @"info"]];
    NSString *message = @"hey";
    if (info)
        message = info;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@ with %@", [workout objectForKey: @"name"], [workout objectForKey:@"instructor"]]
													message:message
												   delegate:nil
										  cancelButtonTitle:@"OK"
										  otherButtonTitles:nil];
        
    [alert show];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

=======
>>>>>>> bfe6fd512b0e839a62d97f6e03c1d6164959b704
-(IBAction)nextDay:(id)sender {
    self.initialDay = self.nextDay;
    [self loadData];
    [self.tableView reloadData];
}

-(IBAction)previousDay:(id)sender {
    self.initialDay = self.previousDay;
    [self loadData];
    [self.tableView reloadData];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

<<<<<<< HEAD
=======
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}
>>>>>>> bfe6fd512b0e839a62d97f6e03c1d6164959b704

@end
