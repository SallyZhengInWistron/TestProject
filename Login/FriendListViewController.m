//
//  FriendListViewController.m
//  Login
//
//  Created by 鄭淳文 on 2015/9/16.
//  Copyright (c) 2015年 SallyZheng. All rights reserved.
//

#import "FriendListViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
@interface FriendListViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *friendImage;
@property (weak, nonatomic) IBOutlet UILabel *friendName;

@end

@implementation FriendListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    if ([FBSDKAccessToken currentAccessToken]) {
        NSLog(@"Log in successing");
        [self getFBPersonalData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getFBPersonalData{
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me/taggable_friends" parameters:@{@"fields" : @"email,name"}]
     //@{@"fields" : @"email,name,",@"context" : @"all_mutual_friends"}
     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
         if (!error) {
             //NSLog(@"%@",result[@"id"]);
             
             NSArray * friends = result[@"data"];
             NSDictionary * friendData = friends[0];
             NSLog(@"%@",friendData[@"id"]);
             NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=normal",friendData[@"id"]]];
             NSData  *data = [NSData dataWithContentsOfURL:url];
             self.friendImage.image = [UIImage imageWithData:data];
             self.friendName.text = friendData[@"name"];
//             self.friendName.text = result[@"name"];
//             NSURL *url = [[NSURL alloc]initWithString:result[@"picture"]];
//             NSLog(@"%@",url);
//             self.friendImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url ]];
         }
     }];}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
