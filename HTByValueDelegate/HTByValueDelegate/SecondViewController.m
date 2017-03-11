//
//  SecondViewController.m
//  HTByValueDelegate
//
//  Created by 一米阳光 on 17/3/11.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<
UITextFieldDelegate>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    [self createTextField];
}

- (void)createTextField {
    UITextField * tf = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, self.view.bounds.size.width-100, 30)];
    tf.placeholder = @"请输入文字";
    tf.delegate = self;
    [self.view addSubview:tf];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //<3>调用代理
    if (self.delegate && [self.delegate respondsToSelector:@selector(changeText:)]) {
        [self.delegate changeText:textField.text];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    return YES;
}

@end
