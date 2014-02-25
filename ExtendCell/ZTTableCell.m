//
//  ZTTableCell.m
//  ExtendCell
//
//  Created by 翟涛 on 14-2-25.
//  Copyright (c) 2014年 翟涛. All rights reserved.
//

#import "ZTTableCell.h"

@implementation ZTTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIColor *color = [UIColor colorWithRed:0.7 green:1.0 blue:0.7 alpha:1.0];
        self.contentView.backgroundColor = color;
        UILabel* nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 70, 20)];
        nameLabel.text = @"name:";
        nameLabel.textAlignment = NSTextAlignmentRight;
        nameLabel.font = [UIFont boldSystemFontOfSize:17];
        nameLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:nameLabel];
        UILabel* priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 30, 70, 20)];
        priceLabel.text = @"price:";
        priceLabel.textAlignment = NSTextAlignmentRight;
        priceLabel.font = [UIFont boldSystemFontOfSize:17];
        priceLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:priceLabel];
        self.nameField = [[UILabel alloc]initWithFrame:CGRectMake(90, 5, 180, 20)];
        self.nameField.textAlignment = NSTextAlignmentLeft;
        self.nameField.textColor = [UIColor blueColor];
        [self.contentView addSubview:self.nameField];
        self.proceField = [[UILabel alloc]initWithFrame:CGRectMake(90, 30, 180, 20)];
        self.proceField.textAlignment = NSTextAlignmentLeft;
        self.proceField.textColor = [UIColor blueColor];
        [self.contentView addSubview:self.proceField];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
