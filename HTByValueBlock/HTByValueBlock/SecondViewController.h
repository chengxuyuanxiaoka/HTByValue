//
//  SecondViewController.h
//  HTByValueBlock
//
//  Created by 一米阳光 on 17/3/11.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

//<1>声明block
@property (nonatomic, copy) void(^block)(NSString *);

@end
