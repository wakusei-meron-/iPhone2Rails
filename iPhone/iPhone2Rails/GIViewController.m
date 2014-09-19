//
//  GIViewController.m
//  iPhone2Rails
//
//  Created by Genki Ishibashi on 2013/11/27.
//  Copyright (c) 2013年 Genki Ishibashi. All rights reserved.
//

#import "GIViewController.h"
#import <AFNetworking.h>
#import <AVFoundation/AVFoundation.h>

@interface GIViewController ()
@end

@implementation GIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self initialize];
    
}

#pragma mark - 自作関数

//デリゲートなどの初期設定
- (void)initialize
{
    
    //TableViewの初期設定
    self.tableViewNameList.dataSource = self.tableViewNameList;
    self.tableViewNameList.delegate = self.tableViewNameList;
    
    //UITextFieldの初期設定
    self.txfInputName.delegate = self;
    [self.txfInputName becomeFirstResponder];
    self.txfInputName.placeholder = @"登録したい名前を入力してね";
    
}

//サーバーのあるURLの設定
#define NAMELISTURL @"http://localhost:3000/tops.json"

- (IBAction)postData:(id)sender {//テキストフィールドのデータの送信
    
    //送信パラメータの準備
    NSDictionary *params = [NSDictionary dictionaryWithObject:self.txfInputName.text forKey:@"top[name]"];
    
    //HTTP通信クライアント生成・通信処理
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:NAMELISTURL parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject){
              
              //通信が成功した時の処理
              NSLog(@"JSON: %@", responseObject);
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error){
              
              //通信が失敗した時の処理
              NSLog(@"error: %@", error);
          }];
}

- (IBAction)getData:(id)sender {
    
    //HTTP通信クライアント生成・通信処理
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:NAMELISTURL parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject){
             
             //データの取得に成功した時の処理
             NSLog(@"success: %@", responseObject);
             
             //取得したJSONデータを配列に格納
             NSMutableArray *names = [NSMutableArray array];
             for (NSDictionary *jsonObject in responseObject) {
                 
                 [names addObject:[jsonObject objectForKey:@"name"]];
                 
             }
             
             //テーブルビューに配列の中身をセットして更新
             self.tableViewNameList.nameList = names;
             [self.tableViewNameList reloadData];
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error){
             
             //データの取得に失敗した時の処理
             NSLog(@"error: %@", error);
         }];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    return YES;
}

@end
