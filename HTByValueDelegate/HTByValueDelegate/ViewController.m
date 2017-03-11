//
//  ViewController.m
//  HTByValueDelegate
//
//  Created by 一米阳光 on 17/3/11.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "HTTools.h"

@interface ViewController ()<
UITextViewDelegate,
SecondVCDelegate>

@end

@implementation ViewController {
    UITextView * _tv;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTextView];
    [self createButton];
}

- (void)createTextView {
    _tv = [[UITextView alloc] initWithFrame:CGRectMake(100, 200, self.view.bounds.size.width-200, 200)];
    _tv.backgroundColor = [UIColor cyanColor];
    _tv.delegate = self;
    [self.view addSubview:_tv];
}

- (void)createButton {
    UIButton * button = [HTTools createButton:CGRectMake(100, 100, self.view.bounds.size.width-200, 100) bgColor:nil title:@"传值" titleColor:[UIColor blackColor] tag:101 action:@selector(buttonClick:) vc:self];
    [self.view addSubview:button];
}

- (void)buttonClick:(UIButton *)button {
    SecondViewController * secondVC = [[SecondViewController alloc] init];
    //<4>设置代理
    secondVC.delegate = self;
    [self presentViewController:secondVC animated:YES completion:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_tv resignFirstResponder];
}

#pragma mark - UITextViewDelegate
//开始编辑状态
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    [UIView animateWithDuration:0.5 animations:^{
        //相对现在的位置向上移动100
        textView.transform = CGAffineTransformMakeTranslation(0, 50);
    } completion:nil];
    
    return YES;
}

//结束编辑状态
- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    [UIView animateWithDuration:0.5 animations:^{
        //返回原始位置
        textView.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:nil];
    return YES;
}

//打字的时候就会调用
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSLog(@"%@",text);
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    return YES;
}

#pragma mark - SecondVCDelegate
//<5>实现自定义方法
- (void)changeText:(NSString *)text {
    _tv.text = [NSString stringWithFormat:@"%@---%@",_tv.text,text];
}

@end
