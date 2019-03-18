//
//  QLabel.m
//  hshclient_rn
//
//  Created by qzp on 2018/11/29.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "QLabel.h"

@implementation QLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init {
  if (self = [super init]) {
    self.title = @"";
  }
  return self;
}

- (void)setTitle:(NSString *)title {

  _title = title;
  self.text = title;
  self.textColor = [UIColor blackColor];

  
  self.contentMode = UIViewContentModeTop;
  if(_tags.count>0 && ![_tags.firstObject isEqualToString:@""]) {
    
    NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:self.text];

  for(NSInteger i = 0; i< _tags.count;i++) {
    NSInteger length = [_tags[i] length];
    CGFloat w = 5 + getStringSize(_tags[i], [UIFont systemFontOfSize:12], 500).width;
    
      UIView * faterView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, w+2, 15)];
      UIView * tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, w, 15)];
      UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, w, 15)];
      label.text = _tags[i];
      label.textColor = [UIColor whiteColor];
      label.textAlignment = NSTextAlignmentCenter;
      label.font = [UIFont systemFontOfSize:12];
      tempView.backgroundColor = [UIColor colorWithHexString:@"#ff7200"];
      tempView.layer.cornerRadius = 2;
      [tempView addSubview:label];
    
    [faterView addSubview: tempView];
    
      UIImage * image = [self makeImageWithView: faterView];
      /**
       添加图片到指定的位置
       */
      NSTextAttachment *attchImage = [[NSTextAttachment alloc] init];
      // 表情图片
      attchImage.image = image;
      // 设置图片大小
      attchImage.bounds = CGRectMake(8, -2.5, w+2, 15);
      NSAttributedString *stringImage = [NSAttributedString attributedStringWithAttachment:attchImage];
      [attriStr insertAttributedString:stringImage atIndex:i];
    
  }
  
    self.attributedText = attriStr;
  
    
  } else {
    self.attributedText = [[NSMutableAttributedString alloc] initWithString:self.text];
  }

  
  
}

- (UIImage *)makeImageWithView:(UIView *)view
{
  
  // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了，关键就是第三个参数 [UIScreen mainScreen].scale。
  UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
  [view.layer renderInContext:UIGraphicsGetCurrentContext()];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return image;
  
}
- (void)setModel:(NSDictionary *)model {
  _model = model;
  if (_model[@"color"]!=nil) {
    self.textColor = [UIColor colorWithHexString: _model[@"color"]];
  }
  if (_model[@"fontSize"]!=nil) {
    self.font = [UIFont systemFontOfSize:[_model[@"fontSize"] floatValue]];
  }
  if (_model[@"numberOfLines"]!=nil) {
    self.numberOfLines = [_model[@"numberOfLines"] integerValue];
  }
}

- (void)setTags:(NSArray *)tags {
  _tags = tags;
  if(tags.count>0) {
    NSMutableString * allStr = [NSMutableString string];
    for (NSString* subStr in tags) {
      [allStr appendString:@"          "];
    }
    NSMutableString * lastStr = [NSMutableString stringWithString: allStr];
    if (self.text) {
       [lastStr appendString: self.title];
    }
   
    self.text = lastStr;
    
  }
  
  
}

CGSize getStringSize(NSString *str,UIFont *font,float width){
  CGSize size;
  CGRect rect=[str boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine
                             attributes:@{NSFontAttributeName:font}
                                context:nil];
  size=rect.size;
  return size;
  
}

@end
