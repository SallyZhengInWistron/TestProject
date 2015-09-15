//
//  ViewController.m
//  Login
//
//  Created by 鄭淳文 on 2015/9/14.
//  Copyright (c) 2015年 SallyZheng. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@interface ViewController ()
//@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
//.....
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
    loginButton.readPermissions =
    @[@"public_profile", @"email", @"user_friends"];
    [FBSDKSettings setAppID:@"547875902031699"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
