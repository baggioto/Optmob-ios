//
//  LoginViewController.m
//  Optmob
//
//  Created by Baggioto on 23/05/2018.
//  Copyright © 2018 Feliggioto. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self blurryFace];
    
    self.facebookButton.readPermissions = @[@"public_profile", @"email"];
    
    if ([FBSDKAccessToken currentAccessToken]) {
    
    //Pass to next screen
        
    }
    
    // Do any additional setup after loading the view.
}

- (void)blurryFace{
    
    if (!UIAccessibilityIsReduceTransparencyEnabled()) {
        self.view.backgroundColor = [UIColor clearColor];
        
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
        UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        //always fill the view
        blurEffectView.frame = self.view.bounds;
        blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
//        [self.view sendSubviewToBack:blurEffectView];
        
        UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"splash.png"]];
        backgroundImage.frame = self.view.bounds;
        backgroundImage.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [self.view addSubview:backgroundImage];
        [self.view sendSubviewToBack:backgroundImage];
        
        [self.view addSubview:blurEffectView];
        //if you have more UIViews, use an insertSubview API to place it where needed
        
        [self makeThingsRight];
        
    } else {
        self.view.backgroundColor = [UIColor blackColor];
    }
    
}
    
- (void)makeThingsRight{
    
    for (id coisaDaTela in self.view.subviews) {
        if([coisaDaTela isKindOfClass:[UIButton class]] || [coisaDaTela isKindOfClass:[UIView class]] || [coisaDaTela isKindOfClass:[UIImageView class]] || [coisaDaTela isKindOfClass:[FBSDKLoginButton class]]){
            if([coisaDaTela isKindOfClass:[UIVisualEffectView class]]){
                NSLog(@"kk");
            } else if([coisaDaTela isKindOfClass:[UIImageView class]]) {
                UIImageView *kkk = (UIImageView *)coisaDaTela;
                if([[kkk image] isEqual:[UIImage imageNamed:@"splash.png"]]){
                    NSLog(@"achei");
                }else{
                    [self.view bringSubviewToFront:coisaDaTela];
                }
            } else{
                [self.view bringSubviewToFront:coisaDaTela];
            }
        }
    }
    
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
