//
//  TableViewController.h
//  cutomTable
//
//  Created by user148840 on 2/5/19.
//  Copyright © 2019 user148840. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewController : UITableViewController{
    
    NSMutableArray *movies;
    NSMutableArray *year;
    NSMutableArray *imgs;
    NSUInteger index;
    NSArray *searchResults; 
}

@property (nonatomic,copy)NSArray *title1;
@property(nonatomic,copy)NSArray * year1;
@property (nonatomic,copy)NSArray * poster;


@end

NS_ASSUME_NONNULL_END
