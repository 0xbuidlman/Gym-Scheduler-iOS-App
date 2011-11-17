//
//  ScheduleViewController.m
//  blahhzers
//
//  Created by Kyle Murphy on 11/13/11.
//  Copyright (c) 2011 None.  Student. All rights reserved.
//

#import "ScheduleViewController.h"


@implementation ScheduleViewController
@synthesize data, stuff, days, currentClasses, schedule_id, weekday, day, previousDay, nextDay;

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
        NSLog(@"Fetching schedule JSON data");
        
        // Prepare URL request to download statuses from Twitter
        NSString *scheduleUrl = [NSString stringWithFormat:@"http://dobby-rails-app.dev/schedules/%@/workouts.json", self.schedule_id];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:scheduleUrl]];
        
        // Perform request and get JSON back as a NSData object
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        NSError* error;
        NSDictionary * jsonArr = [NSJSONSerialization 
                             JSONObjectWithData:response //1                              
                             options:kNilOptions
                             error:&error];
        
        self.stuff = jsonArr;
        NSLog(@"sched jsonArr: %@", jsonArr);        
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
    
    return [NSString stringWithFormat:@"%@ %@", thisWeekday, thisDay];
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self myData];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];  
    [dateFormatter setDateFormat:@"EEEE"];
    self.weekday = [dateFormatter stringFromDate:[NSDate date]];
    [dateFormatter setDateFormat:@"MM/dd"];
    self.day = [dateFormatter stringFromDate:[NSDate date]];
    
    self.nextDay.title = [self formattedDate:[NSDate date] offsetby:1];
    self.previousDay.title = [self formattedDate:[NSDate date] offsetby:-1];
    
    NSArray *classes = [self.stuff objectForKey:weekday];

    self.currentClasses = classes;
    
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
    NSUInteger row = [indexPath row];
        
    UITableViewCell *cell = [tableView 
                             dequeueReusableCellWithIdentifier:@"ScheduleCell"];
    
    NSLog(@"current classes: %@", self.currentClasses);
    
    NSDictionary *workout = [self.currentClasses objectAtIndex:row];
        
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
    
    // Configure the cell.
    return cell;
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

@end
