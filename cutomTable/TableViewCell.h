//
//  TableViewCell.h
//  cutomTable
//
//  Created by user148840 on 2/5/19.
//  Copyright © 2019 user148840. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblYear;
@property (strong, nonatomic) IBOutlet UIImageView *imgPoster;


@end

NS_ASSUME_NONNULL_END
