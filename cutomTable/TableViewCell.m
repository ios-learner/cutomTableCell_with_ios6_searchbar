//
//  TableViewCell.m
//  cutomTable
//
//  Created by user148840 on 2/5/19.
//  Copyright © 2019 user148840. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

@synthesize lblTitle,lblYear,imgPoster;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
