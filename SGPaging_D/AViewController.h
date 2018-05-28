//
//  AViewController.h
//  SGPaging_D
//
//  Created by idea on 2018/5/28.
//  Copyright © 2018年 idea. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^myblock)(NSString*str);
@interface AViewController : UIViewController
@property (nonatomic, copy) NSString *str;
@property (nonatomic, copy) myblock block;
@end
