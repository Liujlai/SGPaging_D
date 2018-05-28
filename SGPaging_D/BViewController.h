//
//  BViewController.h
//  SGPaging_D
//
//  Created by idea on 2018/5/28.
//  Copyright © 2018年 idea. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^myblock)(NSString*str);
@interface BViewController : UIViewController
@property (nonatomic, copy) myblock Bblock;
@property (nonatomic, copy) NSString *Bstr;
@end
