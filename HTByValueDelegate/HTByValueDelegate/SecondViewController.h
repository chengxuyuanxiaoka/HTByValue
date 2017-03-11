//
//  SecondViewController.h
//  HTByValueDelegate
//
//  Created by 一米阳光 on 17/3/11.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import <UIKit/UIKit.h>

//<1>声明协议
@protocol SecondVCDelegate <NSObject>

- (void)changeText:(NSString *)text;

@end

@interface SecondViewController : UIViewController

//<2>声明代理
@property (nonatomic, assign) id<SecondVCDelegate>delegate;

@end
