//
//  MoviesTableViewCell.h
//  CustomizingTableViewCell
//
//  Created by abc on 28/01/15.
//  Copyright (c) 2015 com.ms. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableCell : MoviesTableViewController
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *year;
@property (nonatomic, copy) NSString *poster;

@end
