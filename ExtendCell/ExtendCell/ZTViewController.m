//
//  ZTViewController.m
//  ExtendCell
//
//  Created by 翟涛 on 14-2-25.
//  Copyright (c) 2014年 翟涛. All rights reserved.
//

#import "ZTViewController.h"
#import "ZTTableCell.h"
@interface ZTViewController ()

@end
NSArray *books;
NSArray *prices;
@implementation ZTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	books = [NSArray arrayWithObjects:@"string1",@"string2",@"string3",nil];
    prices = [NSArray arrayWithObjects:@"price1",@"price2",@"price3",nil];
    self.table.delegate = self;
    self.table.dataSource = self;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellId = @"cellId";
    ZTTableCell* cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[ZTTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    NSUInteger rowNo = indexPath.row;
    cell.layer.cornerRadius = 12;
    cell.layer.masksToBounds = YES;
    cell.nameField.text = [books objectAtIndex:rowNo];
    cell.proceField.text = [prices objectAtIndex:rowNo];
    
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return books.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
