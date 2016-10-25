//
//  YLSupportViewController.m
//  YLHVScreen
//
//  Created by 刘云 on 2016/10/25.
//  Copyright © 2016年 YouLing. All rights reserved.
//

#import "YLSupportViewController.h"

@interface YLSupportViewController ()

@end

@implementation YLSupportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
   /* UIButton* btn_to_notsupport = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 100, 30)];
    
    [btn_to_notsupport setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [btn_to_notsupport setTitle:@"跳转到不支持界面" forState:UIControlStateNormal];
    
    [btn_to_notsupport addTarget:self action:@selector(btn_to_) forControlEvents:UIControlEventTouchUpInside];*/
}
-(void) btn_to_
{
    NSLog(@"22222");
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
