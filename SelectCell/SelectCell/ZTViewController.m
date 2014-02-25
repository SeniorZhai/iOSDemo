//
//  ZTViewController.m
//  SelectCell
//
//  Created by 翟涛 on 14-2-25.
//  Copyright (c) 2014年 翟涛. All rights reserved.
//

#import "ZTViewController.h"
#import "ZTAppDelegate.h"

@interface ZTViewController ()

@end
ZTAppDelegate* appDelegate;

@implementation ZTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.table.delegate = self;
    self.table.dataSource = self;
    appDelegate = [UIApplication sharedApplication].delegate;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.table reloadData];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellID = @"cellID";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSUInteger rowNo = indexPath.row;
    cell.textLabel.text = [appDelegate.books objectAtIndex:rowNo];
    cell.layer.cornerRadius = 12;
    cell.layer.masksToBounds = YES;
    cell.detailTextLabel.text = [appDelegate.details objectAtIndex:rowNo];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return appDelegate.books.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d",indexPath.row);
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
