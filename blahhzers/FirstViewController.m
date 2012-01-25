//
//  FirstViewController.m
//  blahhzers
//
//  Created by Kyle Murphy on 11/12/11.
//  Copyright (c) 2011 None.  Student. All rights reserved.
//

#import "FirstViewController.h"

@implementation FirstViewController

@synthesize data, stuff, schedule_id, schedule_name, location_id;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void) myData {
	if (!data) {
        // Log this event
        NSLog(@"Fetching JSON data");
                
        // Prepare URL request to download statuses from Twitter
        NSString *url = [NSString stringWithFormat:@"http://dobby-rails-app.dev/locations/%@/schedules.json", self.location_id];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        
        // Perform request and get JSON back as a NSData object
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        NSError* error;
        NSArray * jsonArr = [NSJSONSerialization 
                              JSONObjectWithData:response //1                              
                              options:kNilOptions 
                              error:&error];
        
        self.stuff = jsonArr;
        NSLog(@"jsonArr: %@", jsonArr);        
	}
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self myData];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
	return [self.stuff count];
}
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    
    UITableViewCell *cell = [tableView 
                             dequeueReusableCellWithIdentifier:@"GymCell"];
    cell.textLabel.text = [[self.stuff objectAtIndex:row] objectForKey:@"name"];

    // Configure the cell.
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section {
	return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    self.schedule_id = [[self.stuff objectAtIndex:row] objectForKey:@"id"];
    self.schedule_name = [[self.stuff objectAtIndex:row] objectForKey:@"name"];
    [self performSegueWithIdentifier:@"ShowClasses" sender:(id)self];
    NSLog(@"Location id: %@", self.location_id);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"ShowClasses"])
	{
		ScheduleViewController *scheduleController = segue.destinationViewController;
        scheduleController.schedule_id = self.schedule_id;
        scheduleController.title = self.schedule_name;
	}
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
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
