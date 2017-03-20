//
//  ViewController.m
//  BgImgTextView
//
//  Created by sungrow on 2017/3/8.
//  Copyright © 2017年 sungrow. All rights reserved.
//

#import "ViewController.h"
#import "BgImgTextView.h"

@interface ViewController ()<UITextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BgImgTextView *imgTxtV = [[BgImgTextView alloc] init];
    imgTxtV.placeholder = @"请输入文字";
    imgTxtV.frame = CGRectMake(10, 30, 300, 200);
    imgTxtV.edgeInsets = UIEdgeInsetsMake(20, 0, 0, 0);
    imgTxtV.textColor = [UIColor redColor];
    imgTxtV.delegate = self;
    imgTxtV.text = @"NSArray *hconstraint = [NSLayoutConstraint constraintsWithVisualFormat:hVFL options:NSLayoutFormatDirectionLeadingToTrailing metrics:metircs views:views];NSArray *hconstraint1 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL1 options:NSLayoutFormatDirectionLeadingToTrailing metrics:metircs views:views];NSArray *vconstraint = [NSLayoutConstraint constraintsWithVisualFormat:vVFL options:NSLayoutFormatDirectionLeadingToTrailing metrics:metircs views:views];NSArray *vconstraint1 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL1 options:NSLayoutFormatDirectionLeadingToTrailing metrics:metircs views:views];";
    [self.view addSubview:imgTxtV];
    
    BgImgTextView *imgTxtV2 = [[BgImgTextView alloc] init];
    imgTxtV2.frame = CGRectMake(10, 300, 300, 100);
    imgTxtV2.bgImgName = @"chat_send_nor";
    imgTxtV2.edgeInsets = UIEdgeInsetsMake(10, 15, 10, 10);
    imgTxtV2.text = @"NSArray *hconstraint = [NSLayoutConstraint constraintsWithVisualFormat:hVFL options:NSLayoutFormatDirectionLeadingToTrailing metrics:metircs views:views];NSArray *hconstraint1 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL1 options:NSLayoutFormatDirectionLeadingToTrailing metrics:metircs views:views];NSArray *vconstraint = [NSLayoutConstraint constraintsWithVisualFormat:vVFL options:NSLayoutFormatDirectionLeadingToTrailing metrics:metircs views:views];NSArray *vconstraint1 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL1 options:NSLayoutFormatDirectionLeadingToTrailing metrics:metircs views:views];";
    [self.view addSubview:imgTxtV2];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView {
    NSLog(@"-----------> 开始编辑");
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    NSLog(@"-----------> 结束编辑");
}

- (void)textViewDidChange:(UITextView *)textView {
    NSLog(@"-----------> 改变文字内容");
}

@end
