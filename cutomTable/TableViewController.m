//
//  TableViewController.m
//  cutomTable
//
//  Created by user148840 on 2/5/19.
//  Copyright © 2019 user148840. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"


@interface TableViewController ()

@end

@implementation TableViewController{
//last add
    
}
@synthesize title1,year1,poster;


- (void)viewDidLoad {
    [super viewDidLoad];

    
    movies = [ NSArray arrayWithObjects:@"Dhoom",@"DedhIshquiya",@"Happy New Year",@"Luck By Chance",@"Vicky Donor", nil];
    year = [ NSArray arrayWithObjects:@"2000",@"2013",@"2014",@"2010",@"2012", nil];
    imgs = [ NSArray arrayWithObjects:@"Dhoom_poster.jpg",@"DedhIshquiya.jpg",@"HappyNewYear_Poster.jpg",@"LuckByChance_Poster.jpg", @"VickyDonor_Poster.jpg", nil];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
    return [searchResults count];
    
    }
    else
    {
     return [movies count];
    }
}
///added by chetan sir
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 124.5f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *cellIdentifier = @"M";
    TableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
    NSPredicate *resultPredicate = [NSPredicate
                                        predicateWithFormat:@"SELF contains[cd] %@",
                                        [searchResults objectAtIndex:indexPath.row]];
        
        
        //NSPredicate *exists = [NSPredicate predicateWithFormat: @"%K MATCHES[c] %@", key, value];
    index = [movies indexOfObjectPassingTest:^(id obj, NSUInteger idx, BOOL *stop) {                    return [resultPredicate evaluateWithObject:obj];
                 }];
        
        
    cell.lblTitle.text  = searchResults[indexPath.row];
    cell.imgPoster.image = [UIImage imageNamed:[imgs objectAtIndex:index]];
    cell.lblYear.text = [year objectAtIndex:index];

    } else {
        
    cell.lblTitle.text  = [movies objectAtIndex:indexPath.row];
    cell.lblYear.text = [year objectAtIndex:indexPath.row];
    cell.imgPoster.image = [UIImage imageNamed:[imgs objectAtIndex:indexPath.row]];

    }
   
    
    return cell;
    

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{


    TableViewCell *cell1 = (TableViewCell *)[tableView cellForRowAtIndexPath:indexPath];


    UILabel *lblValue =cell1.lblTitle;

    UIAlertView *messageAlert = [[UIAlertView alloc]
                                 initWithTitle:@"Row Selected" message:lblValue.text delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];

    // Display Alert Message
    [messageAlert show];
   cell1.accessoryType = UITableViewCellAccessoryCheckmark;

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
      [movies removeObjectAtIndex:indexPath.row];
      [year removeObjectAtIndex:indexPath.row];
      [imgs removeObjectAtIndex:indexPath.row];
    [tableView reloadData];
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];

    searchResults = [movies filteredArrayUsingPredicate:resultPredicate];

}


-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];

    return YES;
}
@end
