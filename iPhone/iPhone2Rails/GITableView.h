//
//  GITableView.h
//  iPhone2Rails
//
//  Created by Genki Ishibashi on 2013/11/27.
//  Copyright (c) 2013年 Genki Ishibashi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GITableView : UITableView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain)NSArray *nameList;

@end
