//
//  YQTextView.m
//  operation4ios
//
//  Created by sungrow on 2017/3/7.
//  Copyright © 2017年 阳光电源股份有限公司. All rights reserved.
//

#import "YQTextView.h"
#import "UIView+Frame.h"

@interface YQTextView ()

/** 占位文字的label */
@property (nonatomic,weak)UILabel *placeholderLabel;

@end

@implementation YQTextView

- (UILabel *)placeholderLabel {
    
    if (!_placeholderLabel) {
        UILabel *label = [[UILabel alloc]init];
        _placeholderLabel = label;
        _placeholderLabel.numberOfLines = 0;
        _placeholderLabel.x = 4;
        _placeholderLabel.y = 7;
        [self addSubview:_placeholderLabel];
    }
    return _placeholderLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//        设置永远有弹簧效果
        self.alwaysBounceVertical = YES;
//        设置默认的字体
        self.font = [UIFont systemFontOfSize:15];
//        设置默认占位文字颜色
        self.placehoderColor = [UIColor lightGrayColor];
//        开启通知，监听文本框的输入
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewChangeText:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)textViewChangeText:(NSNotification *)noti {
    self.placeholderLabel.hidden = self.hasText;
}

//通知一定要移除！！！！！
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//更新占位文字的尺寸
- (void)layoutSubviews {
    [super layoutSubviews];
    CGSize size = CGSizeMake(self.width - 2 * self.placeholderLabel.x, MAXFLOAT);
    self.placeholderLabel.size = [self.placeholderLabel.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.font} context:nil].size;
}

/**
 *使用drawRect方法，绘制占位文字，占位文字不能滑动
 */

//- (void)drawRect:(CGRect)rect {
//
////    系统调用drarect方法之前，会把以前绘制的内容清除
////    判断当前文本框是否有文字
//    if (self.hasText) return;
//
////    传进来的尺寸是（0，-64）
//    rect.origin.x = 4;
//    rect.origin.y = 7;
//
//    rect.size.width -= 2 * rect.origin.x;
//
//    NSMutableDictionary *attribute = [NSMutableDictionary dictionary];
//    attribute[NSFontAttributeName] = self.font;
//    attribute[NSForegroundColorAttributeName] = self.placehoderColor;
////    把占位文字画上去
//    [self.placehoder drawInRect:rect withAttributes:attribute];
//}

//为了严谨，需要时时监听属性的变化，然后重新绘制占位文字
- (void)setPlacehoder:(NSString *)placehoder {
    
    _placehoder = [placehoder copy];
    
    self.placeholderLabel.text = placehoder;
    
    [self setNeedsLayout];
    
}

- (void)setPlacehoderColor:(UIColor *)placehoderColor {
    
    _placehoderColor = placehoderColor;
    
    self.placeholderLabel.textColor = placehoderColor;
    
}

- (void)setText:(NSString *)text {
    
    [super setText:text];
    
    [self textViewChangeText:nil];
    
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    
    [super setAttributedText:attributedText];
    
    [self textViewChangeText:nil];
    
}

- (void)setFont:(UIFont *)font {
    
    [super setFont:font];
    
    self.placeholderLabel.font = font;
    
    [self setNeedsLayout];
    
}

@end
