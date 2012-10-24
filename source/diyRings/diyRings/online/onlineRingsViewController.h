//
//  onlineRingsViewController.h
//  diyRings
//
//  Created by wangping on 12-10-22.
//  Copyright (c) 2012年 lcywp. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface OnlineRingsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    UITableView* _ringTableViewOnline;
    NSArray*     _dataArr;
    NSIndexPath* _selectIndex;
}

@property (retain, nonatomic) UITableView* ringTableViewOnline;
@property (retain, nonatomic) NSArray* dataArr;
@property (retain, nonatomic) NSIndexPath* selectIndex;

@end
