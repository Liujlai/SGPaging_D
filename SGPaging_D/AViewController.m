//
//  AViewController.m
//  SGPaging_D
//
//  Created by idea on 2018/5/28.
//  Copyright © 2018年 idea. All rights reserved.
//

#import "AViewController.h"
#import "BViewController.h"
#define WeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;
@interface AViewController ()

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel * lab = [[UILabel alloc]initWithFrame:(CGRectMake(50, 50, 50, 50))];
    lab.text = self.str;
    [self.view addSubview:lab];
    self.view.backgroundColor = UIColor.greenColor;
    [self setupBtn];
    // Do any additional setup after loading the view.
}
-(void)setupBtn
{
    UIButton *btn = [[UIButton alloc]initWithFrame:(CGRectMake(100, 100, 100, 100))];
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    btn.backgroundColor = UIColor.purpleColor;
    [btn addTarget:self action:@selector(jumpPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.block(self.str);
}
-(void)jumpPage
{
    @WeakObj(self);
    BViewController *vc = [[BViewController alloc]init];
    
    vc.Bblock = ^(NSString *str) {
        selfWeak.block(str);
    };
    vc.Bstr = self.str;
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
