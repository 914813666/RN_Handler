//
//  QLabelManager.m
//  hshclient_rn
//
//  Created by qzp on 2018/11/29.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "QLabelManager.h"
#import "QLabel.h"

@implementation QLabelManager

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(tags, NSArray);
RCT_EXPORT_VIEW_PROPERTY(title, NSString);
RCT_EXPORT_VIEW_PROPERTY(model, NSDictionary);


- (UIView *) view {
  QLabel * label = [[QLabel alloc] init];
  
  return  label;
}

@end
