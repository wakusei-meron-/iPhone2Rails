//
//  GIViewController.h
//  iPhone2Rails
//
//  Created by Genki Ishibashi on 2013/11/27.
//  Copyright (c) 2013年 Genki Ishibashi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GITableView.h"

@interface GIViewController : UIViewController<UITextFieldDelegate>
{
    
}
@property (strong, nonatomic) IBOutlet UITextField *txfInputName;
@property (strong, nonatomic) IBOutlet GITableView *tableViewNameList;


- (IBAction)postData:(id)sender;
- (IBAction)getData:(id)sender;
@end
