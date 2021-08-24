//
//  TestViewController.m
//  Testqwe
//
//  Created by tom555cat on 2021/8/11.
//  Copyright © 2021 tom555cat. All rights reserved.
//

#import "TestViewController.h"
#import "UIView_A.h"
#import "UIView_B.h"
#import "DevilSingleton.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addSubview];
}

- (void)addSubview
{
    UIView_A *a = [[UIView_A alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    a.backgroundColor = [UIColor yellowColor];
    UIView_B *b = [[UIView_B alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    b.backgroundColor = [UIColor purpleColor];
    [a addSubview:b];
    [self.view addSubview:a];
    
    // 单例持有了b
    DevilSingleton.sharedInstance.holder = b;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
