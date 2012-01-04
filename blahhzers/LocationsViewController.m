//
//  LocationsViewController.m
//  dobby
//
//  Created by Kyle Murphy on 12/12/11.
//  Copyright (c) 2011 None.  Student. All rights reserved.
//

#import "LocationsViewController.h"


@implementation LocationsViewController

@synthesize data, stuff, location_id;

- (void) myData {
	if (!data) {
        // Log this event
        NSLog(@"Fetching schedule JSON dataasdfasdf");
        
        // Prepare URL request to download statuses from Twitter
        NSString *scheduleUrl = @"http://dobby-rails-app.dev/accounts/1/locations.json";
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

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self myData];

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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.

    return [self.stuff count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    
    UITableViewCell *cell = [tableView 
                             dequeueReusableCellWithIdentifier:@"LocationCell"];
    cell.textLabel.text = [[self.stuff objectAtIndex:row] objectForKey:@"name"];
    
    // Configure the cell...
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    self.location_id = [[self.stuff objectAtIndex:row] objectForKey:@"id"];
    [self performSegueWithIdentifier:@"ShowSchedules" sender:(id)self];
    NSLog(@"Location id: %@", self.location_id);

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"Sender: %@", sender);
	if ([segue.identifier isEqualToString:@"ShowSchedules"])
	{
		FirstViewController *firstViewController = segue.destinationViewController;
        firstViewController.location_id = self.location_id;
	}
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



@end
