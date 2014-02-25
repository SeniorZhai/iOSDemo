//
//  ZTViewController.h
//  ExtendCell
//
//  Created by 翟涛 on 14-2-25.
//  Copyright (c) 2014年 翟涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;

@end
