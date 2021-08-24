//
//  RootViewController.m
//  Testqwe
//
//  Created by tom555cat on 2021/8/12.
//  Copyright © 2021 tom555cat. All rights reserved.
//

#import "RootViewController.h"
#import "TestViewController.h"
#import "DevilSingleton.h"

@interface RootViewController ()

@property (nonatomic, strong) UIViewController *holder;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addReleaseBtn];
}

- (void)addReleaseBtn
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"释放" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 200, 50, 50);
    [button addTarget:self action:@selector(releaseObj) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)releaseObj
{
    DevilSingleton.sharedInstance.holder = nil;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    TestViewController *vc = [TestViewController new];
    vc.view.backgroundColor = [UIColor redColor];
    //vc.parent = self;
    //self.holder = vc;
    [self presentViewController:vc animated:YES completion:nil];
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
