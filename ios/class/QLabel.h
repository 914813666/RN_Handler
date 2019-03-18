//
//  QLabel.h
//  hshclient_rn
//
//  Created by qzp on 2018/11/29.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QLabel : UILabel
@property (nonatomic,strong) NSArray * tags;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, strong) NSDictionary * model;

@end
