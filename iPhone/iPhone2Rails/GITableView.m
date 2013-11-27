//
//  GITableView.m
//  iPhone2Rails
//
//  Created by Genki Ishibashi on 2013/11/27.
//  Copyright (c) 2013年 Genki Ishibashi. All rights reserved.
//

#import "GITableView.h"

@implementation GITableView

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.nameList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    // スタイルを指定した生成例
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell =
    [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];

    NSLog(@" tableView : %@", self.nameList);
    cell.textLabel.text = [self.nameList objectAtIndex:indexPath.row];
    return cell;
}

@end
